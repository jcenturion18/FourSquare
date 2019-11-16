//
//  LocationManager.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationService: NSObject, CLLocationManagerDelegate {
    
    let locationManager:CLLocationManager
    var delegate:LocationServiceDelegate?
    
    init(locationManager:CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestAuth() -> Void {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            break
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        delegate?.updatedUserLocation(locations.last!)
    }
}
