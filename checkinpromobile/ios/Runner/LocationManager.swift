//
//  LocationManager.swift
//  Runner
//
//  Created by Lee Wong Hao on 6/2/21.
//

import Foundation
import CoreLocation

class LocationManager {
    static let locationManager = LocationManager()
    var locationManager: CLLocationManager!
    var geoCoder: CLGeocoder!
    
    init() {
        locationManager = CLLocationManager()
        geoCoder = CLGeocoder()
    }
    
    func setup() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
    }
    
    func visitReceived(_ visit: CLVisit, callback: @escaping (LocationNativeResponse) -> ()) {
        // create CLLocation from the coordinates of CLVisit
        let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
        // Get location description
        geoCoder.reverseGeocodeLocation(clLocation) { (placemarks, error) in
            if error != nil {
                let location = Location(latitude: clLocation.coordinate.latitude, longitude: clLocation.coordinate.longitude, arriveDate: visit.arrivalDate, departureDate: visit.departureDate, address: "Get geo code location error")
                LocationsStorage.shared.saveLocationOnDisk(location) // Save to local file
                let locationNativeRes = LocationNativeResponse(status: false, location: location)
                // Call back
                callback(locationNativeRes)
            }
            if let place = placemarks?.first {
                let locationName = place.name ?? "" //Location name
                let locality = place.locality ?? "" //Locality
                let subAdministrativeArea = place.subAdministrativeArea ?? "" //SubAdministrativeArea
                let subLocality = place.subLocality ?? "" //subLocality

                var addressString = ""
                if !locationName.isEmpty {
                    addressString = "\(locationName)"
                }
                if !subLocality.isEmpty {
                    if !addressString.isEmpty {
                        addressString += ", "
                    }
                    addressString += "\(subLocality)"
                }
                if !subAdministrativeArea.isEmpty {
                    if !addressString.isEmpty {
                        addressString += ", "
                    }
                    addressString += "\(subAdministrativeArea)"
                }
                if !locality.isEmpty {
                    if !addressString.isEmpty {
                        addressString += ", "
                    }
                    addressString += "\(locality)"
                }
                let location = Location(latitude: clLocation.coordinate.latitude, longitude: clLocation.coordinate.longitude, arriveDate: visit.arrivalDate, departureDate: visit.departureDate, address: addressString)
                LocationsStorage.shared.saveLocationOnDisk(location) // Save to local file
                let locationNativeRes = LocationNativeResponse(status: false, location: location)
                // Call back
                callback(locationNativeRes)
            } else {
                let location = Location(latitude: clLocation.coordinate.latitude, longitude: clLocation.coordinate.longitude, arriveDate: visit.arrivalDate, departureDate: visit.departureDate, address: "Address place mark not found")
                LocationsStorage.shared.saveLocationOnDisk(location) // Save to local file
                let locationNativeRes = LocationNativeResponse(status: false, location: location)
                // Call back
                callback(locationNativeRes)
            }
        }
    }
}


