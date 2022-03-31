package vn.com.unit.checkinpromobile

class NativeLocationResponse {
    private var status = true

    private var location: LocationResponse?

    constructor(status: Boolean, data: LocationResponse?) {
        this.status = status
        this.location = data
    }
}

class LocationResponse {
    private var latitude: Double = 0.0
    private var longitude: Double = 0.0
    private var arriveDate: String = ""
    private var departureDate: String = ""
    private var address: String = ""

    constructor(latitude: Double, longitude: Double, arriveDate: String, departureDate: String, address: String) {
        this.latitude = latitude
        this.longitude = longitude
        this.arriveDate = arriveDate
        this.departureDate = departureDate
        this.address = address
    }
}