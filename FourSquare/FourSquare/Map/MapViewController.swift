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
import PureLayout

class MapViewController: UIViewController {
       
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var showMoreViewContainer: UIView!
    
    let locationService:LocationService
    let mapPresenter:MapPresenter
    let fourSquareService:FourSquareService
    let inMapDetailPresenter:InMapDetailPresenter
    
    init(locationService:LocationService = LocationService(), mapPresenter:MapPresenter = MapPresenter(), fourSquareService:FourSquareService = FourSquareService()
        , inMapDetailPresenter:InMapDetailPresenter = InMapDetailPresenter()){
        self.locationService = locationService
        self.mapPresenter = mapPresenter
        self.fourSquareService = fourSquareService
        self.inMapDetailPresenter = inMapDetailPresenter
        
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
        inMapDetailPresenter.setUp(parentView: view)
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
    func hideDetaillInfo() {
        inMapDetailPresenter.hideDetail()
    }
    
    func showDetaillInfo(forVenue venue: Venue) {
        inMapDetailPresenter.showDetail(withVenue: venue)
    }
    
    func fetchVenuesOnMapCenter(location: CLLocation) {
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

