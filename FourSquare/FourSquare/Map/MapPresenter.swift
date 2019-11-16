//
//  MapPresenter.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit

class MapPresenter: NSObject, MKMapViewDelegate {

    weak var mapView: MKMapView!{
        didSet{
            mapView.showsUserLocation = true
            mapView.delegate = self
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
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    internal func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //this keeps the user location point as a default blue dot.
        if annotation is MKUserLocation { return nil }
        
        //setup annotation view for map - we can fully customize the marker
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "VenueAnnotationView") as? MKMarkerAnnotationView
        
        //setup annotation view
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "VenueAnnotationView")
            annotationView?.canShowCallout = false
            annotationView?.animatesWhenAdded = true
            annotationView?.markerTintColor = UIColor.orange
            annotationView?.isHighlighted = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}

