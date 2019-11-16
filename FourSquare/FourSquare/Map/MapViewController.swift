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
    @IBOutlet weak var showMoreViewContainer: UIView!
    
    let locationService:LocationService
    let mapPresenter:MapPresenter
    let fourSquareService:FourSquareService
    
    init(locationService:LocationService = LocationService(), mapPresenter:MapPresenter = MapPresenter(), fourSquareService:FourSquareService = FourSquareService()){
        self.locationService = locationService
        self.mapPresenter = mapPresenter
        self.fourSquareService = fourSquareService
        
        super.init(nibName: nil, bundle: nil)
        self.locationService.delegate = self
        self.mapPresenter.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapPresenter.mapView = mapView
        mapPresenter.showMoreViewContainer = showMoreViewContainer
        locationService.requestAuth()
    }
    
    @IBAction func showMoreHereTapped(_ sender: Any) {
        mapPresenter.showMoreHereTapped()
    }
}

extension MapViewController : LocationServiceDelegate{
    func updatedUserLocation(_ location: CLLocation) {
        mapPresenter.center(onLocation: location)
        fetchVenues(onLocation: location)
    }
}

extension MapViewController : MapPresenterDelegate{
    func mapCenter(location: CLLocation) {
        fetchVenues(onLocation: location)
    }
}

extension MapViewController{
    func fetchVenues(onLocation location:CLLocation){
        fourSquareService.venues(forLocation: location, completion: { [weak self] venues, error in
            if (venues != nil) {
                self?.mapPresenter.update(with: venues)
            }
        })
    }
}
