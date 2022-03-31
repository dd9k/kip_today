package vn.com.unit.checkinpromobile

import com.google.gson.Gson
import com.google.gson.JsonObject
import com.google.gson.reflect.TypeToken
import org.json.JSONObject

/**
 * Json convert.
 *
 * @author Khoadd
 * 17/09/2019
 */
class JsonTransformer<T> {

    var gson = Gson()

    fun <T> convertObject(jsonString: String, ofClass: Class<T>): T? {
        return gson.fromJson(jsonString, ofClass)
    }

    inline fun <reified T: Any> jsonStringToObject(jsonString: String?): T? {
        return jsonString?.let { convertObject(it, T::class.java) }
    }

    fun jsonStringToPrinterInfor(jsonString: String): PrinterInfor {
        return gson.fromJson(jsonString, PrinterInfor::class.java)
    }

    fun jsonStringToArrayPrinterInfor(jsonArrayString: String): ArrayList<PrinterInfor> {
        return gson.fromJson(jsonArrayString, object : TypeToken<ArrayList<PrinterInfor>>() {
        }.type)
    }
    
    fun printerInforToJsonString(printerInfor: PrinterInfor): String {
        return gson.toJson(printerInfor)
    }

    fun arrayPrinterInforToJsonString(array: ArrayList<PrinterInfor>): String {
        return gson.toJson(array)
    }

    fun jsonStringToJsonObject(jsonString: String): JsonObject {
        return gson.fromJson(jsonString, JsonObject::class.java) as JsonObject
    }

    fun jsonStringToJSONObject(jsonString: String): JSONObject {
        return gson.fromJson(jsonString, JSONObject::class.java) as JSONObject
    }

    fun jsonStringToNativeResponse(jsonString: String): NativeResponse {
        return gson.fromJson(jsonString, NativeResponse::class.java)
    }

    fun nativeResponseToJsonString(nativeResponse: NativeResponse): String {
        return gson.toJson(nativeResponse)
    }

    fun nativeLocationResponseToJsonString(nativeResponse: NativeLocationResponse): String {
        return gson.toJson(nativeResponse)
    }

    fun jsonStringToNativeRequest(jsonString: String): NativeRequest {
        return gson.fromJson(jsonString, NativeRequest::class.java)
    }

    fun nativeRequestToJsonString(nativeResponse: NativeRequest): String {
        return gson.toJson(nativeResponse)
    }

    companion object {
        // Singleton instance
        private var instance: JsonTransformer<*>? = null

        /**
         * Get singleton instance.
         *
         * @return Singleton instance
         */
        fun <T> getInstance(): JsonTransformer<T> {
            if (instance == null) {
                instance =
                        JsonTransformer<T>()
            }
            @Suppress("UNCHECKED_CAST")
            return instance as JsonTransformer<T>
        }
    }
}