//
//  DistanceCalculator.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/10/20.
//

import UIKit
import CoreLocation

class DistanceCalculator {
    var firstLocation:  CLLocation
    var secondLocation: CLLocation
    var totalDistance:  Double {
        return Double(firstLocation.distance(from: secondLocation))
    }
    
    init(firstLocation: CLLocation, secondLocation: CLLocation) {
        self.firstLocation  = firstLocation
        self.secondLocation = secondLocation
    }
}
