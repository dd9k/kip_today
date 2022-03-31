package vn.com.unit.checkinpromobile

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import android.media.RingtoneManager
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.work.Worker
import androidx.work.WorkerParameters
import vn.com.unit.checkinpromobile.model.ReminderNotification
import kotlin.random.Random

class BackgroundWorker(val context: Context, params: WorkerParameters) : Worker(context, params) {
    override fun doWork(): Result {
        val invitationJson = inputData.getString(Contanst.KEY_INVITATION)
        val invitationNotification = JsonTransformer.getInstance<ReminderNotification>().jsonStringToObject<ReminderNotification>(invitationJson)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            // Create the NotificationChannel, but only on API 26+ because
            // the NotificationChannel class is new and not in the support library
            val name = Contanst.KEY_INVITATION
            val description = "Reminder for invitation"
            val importance = NotificationManager.IMPORTANCE_HIGH
            val channel = NotificationChannel(Contanst.KEY_INVITATION, name, importance)
            val defaultSoundUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)
            val att = AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_NOTIFICATION)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build()
            channel.setSound(defaultSoundUri, att)
            channel.description = description
            channel.setShowBadge(true)

            // Add the channel
            val notificationManager =
                    context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager?

            notificationManager?.createNotificationChannel(channel)
        }
        val notificationId = Random.nextInt(1, 10000)

        val intent = if (Application.isActivityVisible()) {
            Intent().apply {
                flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
                action = Contanst.CHANNEL_REMINDER
                putExtra(Contanst.KEY_INVITATION, invitationJson)
                putExtra(Contanst.KEY_NOTIFY_ID, notificationId.toString())
            }
        } else {
            Intent(context, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_CLEAR_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_NEW_TASK
                putExtra(Contanst.KEY_INVITATION, invitationJson)
                putExtra(Contanst.KEY_NOTIFY_ID, notificationId.toString())
            }
        }

        val pendingIntent: PendingIntent = if (Application.isActivityVisible()) {
            PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_ONE_SHOT)
        } else {
            PendingIntent.getActivity(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_ONE_SHOT)
        }

        // Create the notification
        val builder = NotificationCompat.Builder(context, Contanst.KEY_INVITATION)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setColor(context.resources.getColor(R.color.common_google_signin_btn_text_light))
                .setContentTitle(invitationNotification?.titleNoti ?: "")
                .setContentText(invitationNotification?.contentNoti ?: "")
                .setContentIntent(pendingIntent)
                .setPriority(NotificationCompat.PRIORITY_MAX)
                .setVibrate(LongArray(100))
                .setAutoCancel(true)
                .setDefaults(Notification.DEFAULT_ALL)

        // Show the notification
        NotificationManagerCompat.from(context).notify(notificationId, builder.build())
        return Result.success()
    }
}