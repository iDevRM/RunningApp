//
//  RunRoute.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/9/20.
//

import UIKit
import MapKit


class RunRoute {
    static var arrayOfRouteCoordinates: [CLLocationCoordinate2D] = []
    
    
    func mapPointsFrom(_ array: [CLLocationCoordinate2D]) -> [MKMapPoint] {
        
        var mapPoints = [MKMapPoint]()
        
        for x in array {
            mapPoints.append(MKMapPoint.init(x))
        }
        return mapPoints
    }
    
}
