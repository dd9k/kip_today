//
//  LocationNativeRespone.swift
//  Runner
//
//  Created by Lee Wong Hao on 6/2/21.
//

import Foundation

class LocationNativeResponse: Codable {
    let status: Bool
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case status
        case location
    }
    
    init(status: Bool, location: Location?) {
        self.status = status
        self.location = location
    }
    
}
