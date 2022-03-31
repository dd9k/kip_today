package vn.com.unit.checkinpromobile

import android.annotation.TargetApi
import android.app.*
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Matrix
import android.media.AudioAttributes
import android.media.RingtoneManager
import android.net.Uri
import android.os.*
import android.provider.Settings
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.work.Data
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import com.brother.ptouch.sdk.LabelInfo
import com.brother.ptouch.sdk.NetPrinter
import com.brother.ptouch.sdk.Printer
import com.brother.ptouch.sdk.PrinterInfo
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import vn.com.unit.checkinpromobile.model.ReminderNotification
import java.io.BufferedInputStream
import java.io.File
import java.io.InputStream
import java.util.*
import java.util.concurrent.Callable
import java.util.concurrent.ExecutionException
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import kotlin.collections.ArrayList
import kotlin.random.Random


class MainActivity : FlutterFragmentActivity() {
    private lateinit var nativeRequest: NativeRequest
    var result: MethodChannel.Result? = null
    private var reminderReceiver: ReminderBroadcastReceiver? = null
//    private lateinit var fusedLocationClient: FusedLocationProviderClient
//    private lateinit var locationRequest: LocationRequest
//    private lateinit var locationCallback: LocationCallback
//    private lateinit var currentLocation: Location
//    private lateinit var geofencingClient: GeofencingClient
//    private var geofenceList: ArrayList<Geofence>? = ArrayList()
    private lateinit var flutterEngineLocal: FlutterEngine

//    private val geofencePendingIntent: PendingIntent by lazy {
//        val intent = Intent(this, GeofenceBroadcastReceiver::class.java)
//        // We use FLAG_UPDATE_CURRENT so that we get the same pending intent back when calling
//        // addGeofences() and removeGeofences().
//        PendingIntent.getBroadcast(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)
//    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        this.registerChannel()
        this.flutterEngineLocal = flutterEngine
        this.reminderReceiver = ReminderBroadcastReceiver(flutterEngine)
        val filter = IntentFilter(Contanst.CHANNEL_REMINDER)
        filter.priority = 1000
        registerReceiver(this.reminderReceiver, filter)
        MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_PRINTER).setMethodCallHandler { call, rawResult ->
            this.result = MethodResultWrapper(rawResult)
            nativeRequest = JsonTransformer.getInstance<NativeRequest>().jsonStringToNativeRequest(call.method)
            PrinterTask(this).execute(nativeRequest.actions)
        }
        MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_MEMORY).setMethodCallHandler { call, rawResult ->
            val result = MethodResultWrapper(rawResult)
            if (call.method == Contanst.ACTION_MEMORY) {
                val memory = getMemory()
                result.success(memory)
            }
        }
        MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_REMINDER).setMethodCallHandler { call, rawResult ->
            val result = MethodResultWrapper(rawResult)
            when (call.method) {
                Contanst.ACTION_REMINDER_CREATE -> {
                    val invitationNotification = JsonTransformer.getInstance<ReminderNotification>().jsonStringToObject<ReminderNotification>(call.arguments as String)
                    createReminder(invitationNotification?.delayNoti
                            ?: 300000, call.arguments as String)
                    result.success(null)
                }
                Contanst.ACTION_REMINDER_CHECK -> {
                    result.success(checkCanDrawOverlays())
                }
                Contanst.ACTION_REMINDER_GRANT -> {
                    openSettingOverplay()
                    result.success(null)
                }
                Contanst.ACTION_HANDLER_NOTIFICATION -> {
                    val extras = intent.extras
                    val data = extras?.getString(Contanst.KEY_INVITATION)
                    result.success(data)
                }
            }
        }
        // Initialize the LocationCallback.
//        locationCallback = object : LocationCallback() {
//            override fun onLocationResult(locationResult: LocationResult?) {
//                super.onLocationResult(locationResult)
//                locationResult ?: return
//                currentLocation = locationResult.lastLocation
//                var lat: Double = 0.0
//                var long: Double = 0.0
//                if (currentLocation != null) {
//                    lat = currentLocation.latitude
//                    long = currentLocation.longitude
//                }
//                Log.d("HAO-TEST", "onLocationResult lat: $lat - long: $long")
//                val loc = LocationResponse(lat, long, "ngay 28", "ngay 29", "189/10")
//                val nativeResponse = NativeLocationResponse(true, loc)
//                val jsonString = JsonTransformer.getInstance().nativeLocationResponseToJsonString(nativeResponse)
//                Log.d("HAO-TEST", "jsonString: $jsonString")
//                MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_GET_LOCATION).invokeMethod("getLocation", jsonString)
//            }
//        }
//
//        var lat: Double = 0.0
//        var long: Double = 0.0
//        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
//                != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION)
//                != PackageManager.PERMISSION_GRANTED) {
//            return
//        }
//        createRequestLocation()
//        fusedLocationClient.lastLocation
//                .addOnSuccessListener { loc: Location ->
//                    lat = loc.latitude
//                    long = loc.longitude
//                    Log.d("HAO-TEST", "lat: $lat long: $long")
//                }
//                .addOnFailureListener {
//                    Log.d("HAO-TEST", "Get last location error")
//                }
//
//        fusedLocationClient.requestLocationUpdates(locationRequest,
//                locationCallback,
//                Looper.getMainLooper())

//        buildgeofenceList()
//        geofencingClient?.addGeofences(getGeofencingRequest(), geofencePendingIntent)?.run {
//            addOnSuccessListener {
//                // Geofences added
//                MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_GET_LOCATION).invokeMethod("getLocation", "Parent Geofence Added Successfully")
//                Log.d("HAO-TEST", "\"Parent Geofence Added Successfully\".log(\"GEO\",\"Parent Geofence Success\")")
//            }
//            addOnFailureListener {
//                // Failed to add geofences
//                MethodChannel(flutterEngine.dartExecutor, Contanst.CHANNEL_GET_LOCATION).invokeMethod("getLocation", "Parent Geofence Added Failed")
//                Log.d("HAO-TEST", "\"Parent Geofence Add Failed\".log(\"GEO\", \"Parent Geofence Failed\")")
//            }
//        }
    }

    private fun createReminder(milliseconds: Long, invitationJson: String) {
        val data = Data.Builder()
        data.putString(Contanst.KEY_INVITATION, invitationJson)
        val randomWorkRequest = OneTimeWorkRequestBuilder<BackgroundWorker>()
                .setInitialDelay(milliseconds, TimeUnit.MILLISECONDS)
                .setInputData(data.build())
                .build()
        WorkManager.getInstance().enqueue(randomWorkRequest)
    }


//    private fun createRequestLocation() {
//        locationRequest = LocationRequest.create().apply {
//            interval = 60000
//            fastestInterval = 30000
//            maxWaitTime = 120000
//            priority = LocationRequest.PRIORITY_HIGH_ACCURACY
//        }
//    }
//
//    fun buildGeoFence(geofence: GeofenceModel): Geofence? {
//
//        val latitude = geofence.lat
//        val longitude = geofence.lng
//        val radius = geofence.radius
//
//        if (latitude != null && longitude != null && radius != null) {
//
//            val builder = Geofence.Builder()
//                    .setRequestId(geofence.id)
//                    .setCircularRegion(
//                            latitude,
//                            longitude,
//                            radius.toFloat()
//                    )
//                    // Set the expiration duration of the geofence. This geofence gets automatically
//                    // removed after this period of time.
//                    .setExpirationDuration(Geofence.NEVER_EXPIRE)
//
//            // Set the transition types of interest. Alerts are only generated for these
//            // transition. We track entry and exit transitions in this sample.
//            builder.setTransitionTypes(Geofence.GEOFENCE_TRANSITION_ENTER or Geofence.GEOFENCE_TRANSITION_EXIT)
//
//            return builder.build()
//        }
//        return null
//    }

//    private fun buildgeofenceList() {
//        buildGeoFence(GeofenceModel("p0", 10.77071999446304, 106.68477794213268, 50.0))?.let { geofenceList?.add(it) }
//    }
//
//    private fun getGeofencingRequest(): GeofencingRequest {
//        return GeofencingRequest.Builder().apply {
//            setInitialTrigger(GeofencingRequest.INITIAL_TRIGGER_ENTER)
//            addGeofences(geofenceList)
//        }.build()
//    }

    private fun getFlutterView(): BinaryMessenger? {
        return flutterEngine?.dartExecutor?.binaryMessenger
    }

    private fun getMemory(): Long {
        val mi = ActivityManager.MemoryInfo()
        val activityManager: ActivityManager? = getSystemService(ACTIVITY_SERVICE) as ActivityManager
        activityManager?.getMemoryInfo(mi)
        return mi.totalMem
    }

    private fun checkCanDrawOverlays(): Boolean = Settings.canDrawOverlays(this)

    private fun openSettingOverplay() {
        if ("xiaomi" == Build.MANUFACTURER.toLowerCase(Locale.ROOT)) {
            val intent = Intent("miui.intent.action.APP_PERM_EDITOR")
            intent.setClassName(
                    "com.miui.securitycenter",
                    "com.miui.permcenter.permissions.PermissionsEditorActivity"
            )
            intent.putExtra("extra_pkgname", packageName)
            startActivity(intent)
        } else {
            val overlaySettings = Intent(
                    Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    Uri.parse("package:$packageName")
            )
            startActivityForResult(overlaySettings, 10)
        }
    }

    @TargetApi(Build.VERSION_CODES.O)
    private fun registerChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                    getString(R.string.default_notification_channel_id),
                    "CheckinPro",
                    NotificationManager.IMPORTANCE_HIGH
            )
            val manager: NotificationManager = getSystemService(NotificationManager::class.java) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }

    private class PrinterTask(var mainActivity: MainActivity) : AsyncTask<String, Void, String>() {

        override fun doInBackground(vararg params: String?): String? {
            return when (params[0]) {
                Contanst.ACTION_PRINTER_FIND -> {
                    findPrinter()
                }
                Contanst.ACTION_PRINTER_TEST -> {
                    printTest()
                }
                Contanst.ACTION_PRINTER_PRINT -> {
                    printImage()
                }
                else -> {
                    null
                }
            }
        }

        override fun onPostExecute(result: String?) {
            result?.let {
                mainActivity.result?.success(result)
            } ?: run {
                mainActivity.result?.notImplemented()
            }
            super.onPostExecute(result)
        }

        @Throws(InterruptedException::class, ExecutionException::class)
        fun findPrinter(): String {
            val executor = Executors.newSingleThreadExecutor()
            val callable: Callable<String?> = Callable {
                val nativeResponse: NativeResponse?
                val printer = Printer()
                val printerList: ArrayList<NetPrinter> = ArrayList()
                printerList.addAll(printer.getNetPrinters(Contanst.PRINTER_QL810W))
                nativeResponse = if (printerList.isNotEmpty()) {
                    val listPrinterInfor = ArrayList<PrinterInfor>()
                    for (value in printerList) {
                        val printerInfor = PrinterInfor(Contanst.BROTHER, value.ipAddress, value.modelName, false)
                        listPrinterInfor.add(printerInfor)
                    }
                    NativeResponse(Contanst.SUCCESS, listPrinterInfor, null)
                } else {
                    NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.NO_PRINTER)
                }
                JsonTransformer.getInstance<NativeResponse>().nativeResponseToJsonString(nativeResponse)
            }
            val future = executor.submit(callable)
            return future.get().toString()//returns 2 or raises an exception if the thread dies, so safer
        }

        private fun printImage(): String {
            var nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.COMMUNICATION_ERROR)
            val file = File(mainActivity.filesDir?.absolutePath + Contanst.FOLDER_BADGE, Contanst.BADGE_FILE_TEMPLATE)
            if (file.exists()) {
                val option = BitmapFactory.Options()
                option.inSampleSize = 8
                val bitmap = BitmapFactory.decodeStream(file.inputStream())
                val matrix = Matrix()
                matrix.postRotate(90f)
                val rotatedBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.width, bitmap.height, matrix, true)
                // Specify printer
                val printer = Printer()
                val settings: PrinterInfo = printer.printerInfo
                settings.printerModel = PrinterInfo.Model.QL_810W
                settings.port = PrinterInfo.Port.NET
                settings.ipAddress = mainActivity.nativeRequest.data?.ipAddress
                settings.workPath = mainActivity.filesDir.absolutePath
                // Print Settings
                settings.labelNameIndex = LabelInfo.QL700.W62.ordinal
                settings.printMode = PrinterInfo.PrintMode.FIT_TO_PAGE
                settings.isAutoCut = true
                settings.printQuality = PrinterInfo.PrintQuality.HIGH_RESOLUTION
                printer.printerInfo = settings

                if (printer.startCommunication()) {
                    val result = printer.printImage(rotatedBitmap)
                    nativeResponse = if (result.errorCode != PrinterInfo.ErrorCode.ERROR_NONE) {
                        NativeResponse(Contanst.FAIL, null, getErrorCode(result.errorCode))
                    } else {
                        NativeResponse(Contanst.SUCCESS, null, null)
                    }
                    printer.endCommunication()
                } else {
                    nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.COMMUNICATION_ERROR)
                }
            } else {
                nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.NO_TEST_IMAGE)
            }
            return JsonTransformer.getInstance<NativeResponse>().nativeResponseToJsonString(nativeResponse)
        }

        private fun printTest(): String {
            var nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.COMMUNICATION_ERROR)
            val myAssetPath = "assets/images/${Contanst.BADGE_FILE_TEST}"
            FlutterInjector.instance().flutterLoader().startInitialization(mainActivity)
            val appBundlePath = FlutterInjector.instance().flutterLoader().findAppBundlePath()
            val inputStream: InputStream = mainActivity.applicationContext.assets.open(appBundlePath + File.separator + myAssetPath)

            val bufferedInputStream = BufferedInputStream(inputStream)
            val bitmap = BitmapFactory.decodeStream(bufferedInputStream)
            if (bitmap != null) {
                val printer = Printer()
                val settings: PrinterInfo = printer.printerInfo
                settings.printerModel = PrinterInfo.Model.QL_810W
                settings.port = PrinterInfo.Port.NET
                settings.ipAddress = mainActivity.nativeRequest.data?.ipAddress
                settings.workPath = mainActivity.filesDir.absolutePath
                // Print Settings
                settings.labelNameIndex = LabelInfo.QL700.W62.ordinal
                settings.printMode = PrinterInfo.PrintMode.FIT_TO_PAGE
                settings.isAutoCut = true
                settings.printQuality = PrinterInfo.PrintQuality.HIGH_RESOLUTION
                printer.printerInfo = settings

                if (printer.startCommunication()) {
                    Log.d("PRINTER", "start communication")
                    val result = printer.printImage(bitmap)
                    nativeResponse = if (result.errorCode != PrinterInfo.ErrorCode.ERROR_NONE) {
                        NativeResponse(Contanst.FAIL, null, getErrorCode(result.errorCode))
                    } else {
                        NativeResponse(Contanst.SUCCESS, null, null)
                    }
                    printer.endCommunication()
                } else {
                    Log.d("PRINTER", "cannot start communication")
                    nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.COMMUNICATION_ERROR)
                }
            } else {
                nativeResponse = NativeResponse(Contanst.FAIL, null, Contanst.ErrorCode.NO_TEST_IMAGE)
            }
            Log.d("PRINTER", nativeResponse.toString())
            return JsonTransformer.getInstance<NativeResponse>().nativeResponseToJsonString(nativeResponse)
        }


        fun getErrorCode(errorCode: PrinterInfo.ErrorCode): String {
            when (errorCode) {
                PrinterInfo.ErrorCode.ERROR_NOT_SAME_MODEL ->
                    return Contanst.ErrorCode.NOT_SAME_MODEL
                PrinterInfo.ErrorCode.ERROR_BROTHER_PRINTER_NOT_FOUND ->
                    return Contanst.ErrorCode.BROTHER_PRINTER_NOT_FOUND
                PrinterInfo.ErrorCode.ERROR_PAPER_EMPTY ->
                    return Contanst.ErrorCode.PAPER_EMPTY
                PrinterInfo.ErrorCode.ERROR_BATTERY_EMPTY ->
                    return Contanst.ErrorCode.BATTERY_EMPTY
                PrinterInfo.ErrorCode.ERROR_COMMUNICATION_ERROR ->
                    return Contanst.ErrorCode.COMMUNICATION_ERROR
                PrinterInfo.ErrorCode.ERROR_OVERHEAT ->
                    return Contanst.ErrorCode.OVERHEAT
                PrinterInfo.ErrorCode.ERROR_PAPER_JAM ->
                    return Contanst.ErrorCode.PAPER_JAM
                PrinterInfo.ErrorCode.ERROR_HIGH_VOLTAGE_ADAPTER ->
                    return Contanst.ErrorCode.HIGH_VOLTAGE_ADAPTER
                PrinterInfo.ErrorCode.ERROR_FEED_OR_CASSETTE_EMPTY ->
                    return Contanst.ErrorCode.FEED_OR_CASSETTE_EMPTY
                PrinterInfo.ErrorCode.ERROR_SYSTEM_ERROR ->
                    return Contanst.ErrorCode.SYSTEM_ERROR
                PrinterInfo.ErrorCode.ERROR_NO_CASSETTE ->
                    return Contanst.ErrorCode.NO_CASSETTE
                PrinterInfo.ErrorCode.ERROR_WRONG_CASSETTE_DIRECT ->
                    return Contanst.ErrorCode.WRONG_CASSETTE_DIRECT
                PrinterInfo.ErrorCode.ERROR_CREATE_SOCKET_FAILED ->
                    return Contanst.ErrorCode.CREATE_SOCKET_FAILED
                PrinterInfo.ErrorCode.ERROR_CONNECT_SOCKET_FAILED ->
                    return Contanst.ErrorCode.CONNECT_SOCKET_FAILED
                PrinterInfo.ErrorCode.ERROR_GET_OUTPUT_STREAM_FAILED ->
                    return Contanst.ErrorCode.GET_OUTPUT_STREAM_FAILED
                PrinterInfo.ErrorCode.ERROR_GET_INPUT_STREAM_FAILED ->
                    return Contanst.ErrorCode.GET_INPUT_STREAM_FAILED
                PrinterInfo.ErrorCode.ERROR_CLOSE_SOCKET_FAILED ->
                    return Contanst.ErrorCode.CLOSE_SOCKET_FAILED
                PrinterInfo.ErrorCode.ERROR_OUT_OF_MEMORY ->
                    return Contanst.ErrorCode.OUT_OF_MEMORY
                PrinterInfo.ErrorCode.ERROR_SET_OVER_MARGIN ->
                    return Contanst.ErrorCode.SET_OVER_MARGIN
                PrinterInfo.ErrorCode.ERROR_NO_SD_CARD ->
                    return Contanst.ErrorCode.NO_SD_CARD
                PrinterInfo.ErrorCode.ERROR_FILE_NOT_SUPPORTED ->
                    return Contanst.ErrorCode.FILE_NOT_SUPPORTED
                PrinterInfo.ErrorCode.ERROR_EVALUATION_TIMEUP ->
                    return Contanst.ErrorCode.EVALUATION_TIMEUP
                PrinterInfo.ErrorCode.ERROR_WRONG_CUSTOM_INFO ->
                    return Contanst.ErrorCode.WRONG_CUSTOM_INFO
                PrinterInfo.ErrorCode.ERROR_NO_ADDRESS ->
                    return Contanst.ErrorCode.NO_ADDRESS
                PrinterInfo.ErrorCode.ERROR_NOT_MATCH_ADDRESS ->
                    return Contanst.ErrorCode.NOT_MATCH_ADDRESS
                PrinterInfo.ErrorCode.ERROR_FILE_NOT_FOUND ->
                    return Contanst.ErrorCode.FILE_NOT_FOUND
                PrinterInfo.ErrorCode.ERROR_TEMPLATE_FILE_NOT_MATCH_MODEL ->
                    return Contanst.ErrorCode.TEMPLATE_FILE_NOT_MATCH_MODEL
                PrinterInfo.ErrorCode.ERROR_TEMPLATE_NOT_TRANS_MODEL ->
                    return Contanst.ErrorCode.TEMPLATE_NOT_TRANS_MODEL
                PrinterInfo.ErrorCode.ERROR_COVER_OPEN ->
                    return Contanst.ErrorCode.COVER_OPEN
                PrinterInfo.ErrorCode.ERROR_WRONG_LABEL ->
                    return Contanst.ErrorCode.WRONG_LABEL
                PrinterInfo.ErrorCode.ERROR_PORT_NOT_SUPPORTED ->
                    return Contanst.ErrorCode.PORT_NOT_SUPPORTED
                PrinterInfo.ErrorCode.ERROR_WRONG_TEMPLATE_KEY ->
                    return Contanst.ErrorCode.WRONG_TEMPLATE_KEY
                PrinterInfo.ErrorCode.ERROR_BUSY ->
                    return Contanst.ErrorCode.BUSY
                PrinterInfo.ErrorCode.ERROR_TEMPLATE_NOT_PRINT_MODEL ->
                    return Contanst.ErrorCode.TEMPLATE_NOT_PRINT_MODEL
                PrinterInfo.ErrorCode.ERROR_CANCEL ->
                    return Contanst.ErrorCode.CANCEL
                PrinterInfo.ErrorCode.ERROR_PRINTER_SETTING_NOT_SUPPORTED ->
                    return Contanst.ErrorCode.PRINTER_SETTING_NOT_SUPPORTED
                PrinterInfo.ErrorCode.ERROR_INVALID_PARAMETER ->
                    return Contanst.ErrorCode.INVALID_PARAMETER
                PrinterInfo.ErrorCode.ERROR_INTERNAL_ERROR ->
                    return Contanst.ErrorCode.INTERNAL_ERROR
                PrinterInfo.ErrorCode.ERROR_TEMPLATE_NOT_CONTROL_MODEL ->
                    return Contanst.ErrorCode.TEMPLATE_NOT_CONTROL_MODEL
                PrinterInfo.ErrorCode.ERROR_TEMPLATE_NOT_EXIST ->
                    return Contanst.ErrorCode.TEMPLATE_NOT_EXIST
                PrinterInfo.ErrorCode.ERROR_BUFFER_FULL ->
                    return Contanst.ErrorCode.BUFFER_FULL
                PrinterInfo.ErrorCode.ERROR_TUBE_EMPTY ->
                    return Contanst.ErrorCode.TUBE_EMPTY
                PrinterInfo.ErrorCode.ERROR_TUBE_RIBBON_EMPTY ->
                    return Contanst.ErrorCode.TUBE_RIBBON_EMPTY
                PrinterInfo.ErrorCode.ERROR_UPDATE_FRIM_NOT_SUPPORTED ->
                    return Contanst.ErrorCode.UPDATE_FRIM_NOT_SUPPORTED
                PrinterInfo.ErrorCode.ERROR_OS_VERSION_NOT_SUPPORTED ->
                    return Contanst.ErrorCode.OS_VERSION_NOT_SUPPORTED
                PrinterInfo.ErrorCode.ERROR_RESOLUTION_MODE ->
                    return Contanst.ErrorCode.RESOLUTION_MODE
                PrinterInfo.ErrorCode.ERROR_POWER_CABLE_UNPLUGGING ->
                    return Contanst.ErrorCode.POWER_CABLE_UNPLUGGING
                PrinterInfo.ErrorCode.ERROR_BATTERY_TROUBLE ->
                    return Contanst.ErrorCode.BATTERY_TROUBLE
                PrinterInfo.ErrorCode.ERROR_UNSUPPORTED_MEDIA ->
                    return Contanst.ErrorCode.UNSUPPORTED_MEDIA
                PrinterInfo.ErrorCode.ERROR_TUBE_CUTTER ->
                    return Contanst.ErrorCode.TUBE_CUTTER
                PrinterInfo.ErrorCode.ERROR_UNSUPPORTED_TWO_COLOR ->
                    return Contanst.ErrorCode.UNSUPPORTED_TWO_COLOR
                PrinterInfo.ErrorCode.ERROR_UNSUPPORTED_MONO_COLOR ->
                    return Contanst.ErrorCode.UNSUPPORTED_MONO_COLOR
                PrinterInfo.ErrorCode.ERROR_MINIMUM_LENGTH_LIMIT ->
                    return Contanst.ErrorCode.MINIMUM_LENGTH_LIMIT
                else ->
                    return Contanst.ErrorCode.COMMUNICATION_ERROR
            }
        }
    }

    private class MethodResultWrapper(private val methodResult: MethodChannel.Result) : MethodChannel.Result {
        private val handler: Handler = Handler(Looper.getMainLooper())
        override fun success(result: Any?) {
            handler.post { methodResult.success(result) }
        }

        override fun error(
                errorCode: String?, errorMessage: String?, errorDetails: Any?) {
            handler.post { methodResult.error(errorCode, errorMessage, errorDetails) }
        }

        override fun notImplemented() {
            handler.post { methodResult.notImplemented() }
        }

    }

    override fun onResume() {
        super.onResume()
        Application.activityResumed()
    }

    override fun onStop() {
        Application.activityPaused()
        super.onStop()
    }
}
