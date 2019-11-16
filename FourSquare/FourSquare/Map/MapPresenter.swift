//
//  MapPresenter.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit

class MapPresenter: NSObject {

    weak var mapView: MKMapView!{
        didSet{
            mapView.showsUserLocation = true
            mapView.delegate = self
            mapView.mapType = .mutedStandard
        }
    }
    
    weak var showMoreViewContainer: UIView!{
        didSet{
            showMoreViewContainer.layer.applyShadow()
            showMoreViewContainer.alpha = 0
            _ = ShowMoreButtonStateHide().apply(showMoreViewContainer)
        }
    }
    
    var firsTime = true
    private var venueAnnotations:[MKAnnotation]
    
    var currentMapLocationCenter:CLLocation?
    
    var showMorebuttonState:ShowMoreButtonStateProtocol?
    
    var delegate:MapPresenterDelegate?
    
    override init() {
        self.venueAnnotations = [MKAnnotation]()
        super.init()
    }
        
    func update(with venues:[Venue]?)->Void{
        if let venues = venues{
            addAnnotationsToMap(venues: venues)
        }
    }
    
    private func addAnnotationsToMap(venues: [Venue]){
        venues.forEach { (venue) in
            let venueAnnotation = VenueAnnotation(venue: venue)
            venueAnnotations.append(venueAnnotation)
        }
        DispatchQueue.main.async {
            self.mapView.addAnnotations(self.venueAnnotations)
        }
    }
    
    func center(onLocation location:CLLocation){
        let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
    }
}

extension MapPresenter : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = mapView.centerCoordinate
        
        if (!firsTime){
            showMorebuttonState = ShowMoreButtonStateShow().apply(showMoreViewContainer)
        }
        firsTime = false
        currentMapLocationCenter = CLLocation(latitude: center.latitude, longitude: center.longitude)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? VenueAnnotation{
            delegate?.showDetaillInfo(forVenue: annotation.venue)
        }
    }
}

extension MapPresenter{
    func showMoreHereTapped() {
        showMorebuttonState = showMorebuttonState?.apply(showMoreViewContainer)
        if let currentMapLocationCenter = self.currentMapLocationCenter {
            delegate?.mapCenter(location: currentMapLocationCenter)
        }
    }
}

