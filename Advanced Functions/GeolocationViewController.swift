//
//  GeolocationViewController.swift
//  Advanced Functions
//
//  Created by Ludovic Ollagnier on 24/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit
import CoreLocation

class GeolocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitudeLabel: UILabel! {

        didSet{
            latitudeLabel.text = ""
        }
    }

    @IBOutlet weak var longitudeLabel: UILabel! {

        didSet{
            longitudeLabel.text = ""
        }
    }

    @IBOutlet weak var altitudeLabel: UILabel! {

        didSet{
            altitudeLabel.text = ""
        }
    }

    var locationManager = CLLocationManager()
    var lastUserLocation: CLLocation? {

        didSet {

            if let location = lastUserLocation {
                latitudeLabel.text = "\(location.coordinate.latitude)"
                longitudeLabel.text = "\(location.coordinate.longitude)"
                altitudeLabel.text = "\(location.altitude)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func displayUserLocation(sender: AnyObject) {

        if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }

        locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        lastUserLocation = locations.last
        locationManager.stopUpdatingLocation()
    }
}
