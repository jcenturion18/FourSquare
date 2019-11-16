//
//  MapViewControllerTests.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
import MapKit
@testable import FourSquare

class MapViewControllerTests: XCTestCase {

    func testUpdatedUserLocation_updateMap() {
        
        let expectation:XCTestExpectation = XCTestExpectation(description: "update map")
        let locationService = LocationService(locationManager: CLLocationManagerMock(expectation: nil))
        let mapPresenterMock = MapPresenterMock(expectation: expectation)
        let fourSquareService = FourSquareServiceMock()

        let vc = MapViewController(locationService: locationService, mapPresenter: mapPresenterMock, fourSquareService: fourSquareService)
        
        let userLocation = CLLocation()
        
        vc.updatedUserLocation(userLocation)
        wait(for: [expectation], timeout: 1.0)
    }
}
