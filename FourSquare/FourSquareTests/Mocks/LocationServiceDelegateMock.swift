//
//  LocationServiceDelegateMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
import MapKit
@testable import FourSquare

class LocationServiceDelegateMock: LocationServiceDelegate {
    let expectedLocation:CLLocation
    init(expectedLocation:CLLocation) {
        self.expectedLocation = expectedLocation
    }
    func updatedUserLocation(_ location: CLLocation) {
        XCTAssertEqual(expectedLocation, location)
    }
}
