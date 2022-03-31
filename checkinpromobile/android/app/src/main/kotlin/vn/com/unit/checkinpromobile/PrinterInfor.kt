package vn.com.unit.checkinpromobile

class PrinterInfor {
    var type = ""

    var ipAddress = ""

    var model = ""

    var isConnect = false

    constructor(type: String, ipAddress: String, model: String, isConnect: Boolean) {
        this.type = type
        this.ipAddress = ipAddress
        this.model = model
        this.isConnect = isConnect
    }

    constructor()
}