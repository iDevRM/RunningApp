//
//  MarkSpot.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/9/20.
//

import UIKit
import MapKit


class MarkSpot: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coodinate: CLLocationCoordinate2D) {
        self.coordinate = coodinate
    }
}
