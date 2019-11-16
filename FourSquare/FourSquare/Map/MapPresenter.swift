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
    
    private var venueAnnotations:[MKAnnotation]
    
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
            let venueAnnotation = VenueAnnotation(coordinate: CLLocationCoordinate2D(with: venue.location))
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? VenueAnnotation{
            debugPrint(annotation)
        }
    }
}

