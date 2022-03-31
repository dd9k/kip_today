package vn.com.unit.checkinpromobile.model

class Invitation {
    var invitationName: String? = null

    var branchId: Double? = null

    var branchName: String? = null

    var branchAddress: String? = null

    var visitorType: String? = null

    var visitorTypeValue: String? = null

    var startDate: String? = null

    var endDate: String? = null

    var color: String? = null

    var description: String? = null

    var id: Double? = null

    var guests: ArrayList<Guest>? = ArrayList()

    var isSent: Boolean = false

    var valueReminder: Int? = null

    constructor(invitationName: String?, branchId: Double?, branchName: String?, branchAddress: String?, visitorType: String?, visitorTypeValue: String?, startDate: String?, endDate: String?, color: String?, description: String?, id: Double?, guests: ArrayList<Guest>?, isSent: Boolean, valueReminder: Int?) {
        this.invitationName = invitationName
        this.branchId = branchId
        this.branchName = branchName
        this.branchAddress = branchAddress
        this.visitorType = visitorType
        this.visitorTypeValue = visitorTypeValue
        this.startDate = startDate
        this.endDate = endDate
        this.color = color
        this.description = description
        this.id = id
        this.guests = guests
        this.isSent = isSent
        this.valueReminder = valueReminder
    }
}