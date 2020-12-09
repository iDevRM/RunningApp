//
//  LocationService.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/8/20.
//

import Foundation
import CoreLocation

protocol CustomerUserLocDelegate { // Creating this delegate to pass new location to VC.
    func UserLocationUpdated(location: CLLocation)
}


//Create a location service that handles getting location and managing the accuracy of the location.
class LocationService: NSObject, CLLocationManagerDelegate {
    
    static let instance = LocationService()
    
    var customUserLocDelegate: CustomerUserLocDelegate? // allows the VC to have access
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50
        self.locationManager.startUpdatingLocation()
    }
    
// Every time we go outside of the distance filter, this function is called. In this case its 50 kilometers.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = manager.location?.coordinate
        
        if customUserLocDelegate != nil {
            customUserLocDelegate?.UserLocationUpdated(location: locations.first!)
        }
    }
}
