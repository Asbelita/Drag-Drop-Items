//
//  RegistrationStep4ViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/24/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit
import MapKit

class RegistrationStep4ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 400, longitudinalMeters: 400)
            mapView.setRegion(viewRegion, animated: false)
        }
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
