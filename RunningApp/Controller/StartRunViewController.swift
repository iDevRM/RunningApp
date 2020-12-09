//
//  StartRunViewController.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/8/20.
//

import UIKit
import MapKit

class StartRunViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var totalDistanceLabel: UILabel!
    @IBOutlet weak var startRunButton:     UIButton!
    @IBOutlet weak var mapView:            MKMapView! // Connect mapView to storyboard and set delegate.
    
    var markedSpotAnnotation: MarkSpot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startRunButton.layer.cornerRadius = 8
        
        mapView.delegate = self // delegate set
        checkLocationAuthStatus()
    }
    
    @IBAction func startRunButtonTapped(_ sender: UIButton) {
        guard let coordinates = LocationService.instance.currentLocation else { return }
        setupAnnotation(coordinate:coordinates)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func convertButtonTapped(_ sender: UIBarButtonItem) {
    }
    


}

// The function that checks if we have authorization to get location and if not then request it.
extension StartRunViewController {
    func checkLocationAuthStatus() {
        if LocationService.instance.locationManager.authorizationStatus == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true // once we have auth this will show the blue dot on map to indicate user location.
            LocationService.instance.customUserLocDelegate = self // assiging delegate to self to receive the loction from delegate
        } else {
            LocationService.instance.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func centerMapOnUserLocation(location: CLLocationCoordinate2D) { // used to recenter the map to users location
        // first create a map region
        let region =  MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000) // lat and long is how much of the map you want to see when recentered, basically how zoomed in it is.
        // second set map region of mapview
        self.mapView.setRegion(region, animated: true)
    }
    
    
    func setupAnnotation(coordinate: CLLocationCoordinate2D) {
        markedSpotAnnotation = MarkSpot(coodinate: coordinate)
        mapView.addAnnotation(markedSpotAnnotation!)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { // set up how we want the mapview to display the annotation.
        <#code#>
    }
}

//MARK: - Delegate for new location
extension StartRunViewController: CustomerUserLocDelegate { // conforming VC to Protocol
    func UserLocationUpdated(location: CLLocation) { // receiving new location
        centerMapOnUserLocation(location: location.coordinate)
    }
    
    
    
    
}
