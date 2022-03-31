package vn.com.unit.checkinpromobile

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.text.TextUtils
import android.util.Log
import com.google.android.gms.location.Geofence
import com.google.android.gms.location.GeofenceStatusCodes
import com.google.android.gms.location.GeofencingEvent

class GeofenceBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        val geofencingEvent = GeofencingEvent.fromIntent(intent)
        if (geofencingEvent.hasError()) {
            val errorMessage = GeofenceStatusCodes
                    .getStatusCodeString(geofencingEvent.errorCode)
            Log.d("HAO-TEST", errorMessage)
            return
        }

        // Get the transition type.
        val geofenceTransition = geofencingEvent.geofenceTransition

        // Test that the reported transition was of interest.
        if (geofenceTransition == Geofence.GEOFENCE_TRANSITION_ENTER ||
        geofenceTransition == Geofence.GEOFENCE_TRANSITION_EXIT) {
            // Get the geofences that were triggered. A single event can trigger
            // multiple geofences.
            val triggeringGeofences = geofencingEvent.triggeringGeofences
            val geofenceTransitionDetails = context?.let {
                getGeofenceTransitionDetails(
                        it,
                        geofenceTransition,
                        triggeringGeofences
                )
            }
//            broadcastResult("GeofenceBroadcastReceiver - $geofenceTransitionDetails")
            Log.d("HAO-TEST", "GeofenceBroadcastReceiver - $geofenceTransitionDetails")
        } else {
            // Log the error.
//            broadcastResult("GeofenceBroadcastReceiver - Log the error")
            Log.d("HAO-TEST", " GeofenceBroadcastReceiver - Log the error")
        }
    }

    private fun getGeofenceTransitionDetails(
            context: Context,
            geofenceTransition: Int,
            triggeringGeofences: List<Geofence>): String? {
        val geofenceTransitionString: String? = getTransitionString(geofenceTransition)

        // Get the Ids of each geofence that was triggered.
        val triggeringGeofencesIdsList = ArrayList<Any>()
        for (geofence in triggeringGeofences) {
            triggeringGeofencesIdsList.add(geofence.requestId)
        }
        val triggeringGeofencesIdsString: String = TextUtils.join(", ", triggeringGeofencesIdsList)
        return "$geofenceTransitionString: $triggeringGeofencesIdsString"
    }

    private fun getTransitionString(transitionType: Int): String? {
        return when (transitionType) {
            Geofence.GEOFENCE_TRANSITION_ENTER -> "transition - enter"
            Geofence.GEOFENCE_TRANSITION_EXIT -> "transition - exit"
            else -> "unknown transition"
        }
    }
}