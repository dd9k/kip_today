package vn.com.unit.checkinpromobile

class NativeRequest {
    var actions: String? = null

    var data: PrinterInfor? = null

    constructor()

    constructor(actions: String?, data: PrinterInfor?) {
        this.actions = actions
        this.data = data
    }
}