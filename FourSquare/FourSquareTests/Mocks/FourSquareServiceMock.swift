//
//  FourSquareServiceMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit
@testable import FourSquare

class FourSquareServiceMock: FourSquareService {
    override func fetchVenues(forLocation location: CLLocation, completion: @escaping ([Venue]?, Error?) -> Void) {
        let venue = Venue(id: "id", name: "name", location: Location(lat: 40, lng: 40, address: nil, city: nil, state: nil, country: nil, formattedAddress:nil))
        completion([venue], nil)
    }
}
