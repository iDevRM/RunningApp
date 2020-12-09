//
//  StartRunViewController.swift
//  RunningApp
//
//  Created by Ricardo Martinez on 12/8/20.
//

import UIKit
import MapKit

class StartRunViewController: UIViewController {

    @IBOutlet weak var totalDistanceLabel: UILabel!
    @IBOutlet weak var startRunButton:     UIButton!
    @IBOutlet weak var mapView:            MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startRunButton.layer.cornerRadius = 8
        
        mapView.delegate = self
        checkLocationAuthStatus()
    }
    
    
    @IBAction func startRunButtonTapped(_ sender: Any) {
    }
    
    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func convertButtonTapped(_ sender: UIBarButtonItem) {
    }
    


}

extension StartRunViewController {
    func checkLocationAuthStatus() {
        if LocationService.instance.locationManager.authorizationStatus == .authorizedWhenInUse {
          print("I can see where you are")
        } else {
            LocationService.instance.locationManager.requestWhenInUseAuthorization()
        }
    }
}

//MARK: - <#Section Heading#>
extension StartRunViewController: MKMapViewDelegate {
    
}
