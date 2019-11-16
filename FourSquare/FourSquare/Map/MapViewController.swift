//
//  MainViewController.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/14/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
       
    @IBOutlet weak var mapView: MKMapView!
    
    let locationService:LocationService
    let mapPresenter:MapPresenter
    
    init(locationService:LocationService = LocationService(), mapPresenter:MapPresenter = MapPresenter()){
        self.locationService = locationService
        self.mapPresenter = mapPresenter
        
        super.init(nibName: nil, bundle: nil)
        self.locationService.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapPresenter.mapView = mapView
        locationService.requestAuth()
        
    }
}

extension MapViewController : LocationServiceDelegate{
    func updatedUserLocation(_ location: CLLocation) {
        mapPresenter.center(onLocation: location)
        
        FourSquareService().venues(forLocation: location, completion: { [weak self] venues, error in
            if (venues != nil) {
                self?.mapPresenter.update(with: venues)
            }
        })
    }
}
