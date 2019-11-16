//
//  VenueAnnotation.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit

class VenueAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    
    let venue:Venue
    
    init(venue: Venue) {
        self.coordinate = CLLocationCoordinate2D(with: venue.location)
        self.venue = venue
    }
}
