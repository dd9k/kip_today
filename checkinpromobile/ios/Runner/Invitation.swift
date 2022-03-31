//
//  Invitation.swift
//  Runner
//
//  Created by DANG KHOA on 7/11/21.
//

import Foundation

struct Invitation: Codable {
    var invitationName: String?
    var branchId: Double?
    var branchName: String?
    var branchAddress: String?
    var visitorType: String?
    var visitorTypeValue: String?
    var startDate: String?
    var endDate: String?
    var color: String?
    var description: String?
    var id: Double?
    var isSent: Bool?
    var valueReminder: Int?
    var guests: Array<Guest>? = Array()
}
