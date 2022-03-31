package vn.com.unit.checkinpromobile

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.widget.Toast
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class ReminderBroadcastReceiver(private val flutterEngine: FlutterEngine) : BroadcastReceiver() {

    override fun onReceive(context: Context?, intent: Intent?) {
        val extras = intent?.extras
        val data = extras?.getString(Contanst.KEY_INVITATION)
        MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_REMINDER).invokeMethod(Contanst.ACTION_REMINDER_CREATE, data)
    }
}