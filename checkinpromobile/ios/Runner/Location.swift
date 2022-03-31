//
//  Location.swift
//  Runner
//
//  Created by Lee Wong Hao on 6/2/21.
//

import Foundation

class Location: Codable {
    let latitude: Double
    let longitude: Double
    let arriveDate: String?
    let departureDate: String?
    let address: String
    var date: Date?
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case arriveDate
        case departureDate
        case address
    }
    
    init(latitude: Double, longitude: Double, arriveDate: Date?, departureDate: Date?, address: String) {
        self.latitude = latitude
        self.longitude = longitude
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if (arriveDate != nil) {
            self.arriveDate = dateFormatter.string(from: arriveDate!)
            self.date = arriveDate!
        } else {
            self.arriveDate = ""
            self.date = Date()
        }
        if (departureDate != nil) {
            self.departureDate = dateFormatter.string(from: departureDate!)
        } else {
            self.departureDate = ""
        }
        self.address = address
    }
}
