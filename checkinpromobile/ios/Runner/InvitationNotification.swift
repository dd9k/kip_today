//
//  InvitationNotification.swift
//  Runner
//
//  Created by DANG KHOA on 7/6/21.
//

import Foundation

struct InvitationNotification: Codable {
    var titleNoti: String?
    var contentNoti: String?
    var delayNoti: Int64
    var reminderValue: Int64
    var idInvitation: Int
    var invitation: Invitation
}
