package vn.com.unit.checkinpromobile.model

class ReminderNotification {
    var titleNoti: String? = null

    var contentNoti: String? = null

    var delayNoti: Long? = null

    var reminderValue: Long? = null

    var idInvitation: Int? = null

    var invitation: Invitation? = null

    constructor(titleNoti: String?, contentNoti: String?, delayNoti: Long?, reminderValue: Long?, idInvitation: Int?, invitation: Invitation?) {
        this.titleNoti = titleNoti
        this.contentNoti = contentNoti
        this.delayNoti = delayNoti
        this.reminderValue = reminderValue
        this.idInvitation = idInvitation
        this.invitation = invitation
    }
    
    constructor()
}