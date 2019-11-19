//
//  VenueMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
@testable import FourSquare

class VenueMock {
    class func venue() -> Venue {
        return Venue(id: "id", name: "name", location: Location(lat: 40, lng: 40, address: nil, city: nil, state: nil, country: nil, formattedAddress:nil), contact: nil, rating: nil, ratingColor: nil, ratingSignals: nil, description: nil, bestPhoto: nil, likes: nil)
    }
}
