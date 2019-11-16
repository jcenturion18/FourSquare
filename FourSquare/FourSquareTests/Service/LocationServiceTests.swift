//
//  LocationServiceTests.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
import MapKit
@testable import FourSquare

class LocationServiceTests: XCTestCase {

    func testLocationManager_callUpdateWithCorrectLocation() {
        let expectation:XCTestExpectation = XCTestExpectation(description: "stop service")
        
        let mockLocationManager = CLLocationManagerMock(expectation: expectation)
        
        let locationService = LocationService(locationManager: mockLocationManager)
        
        let aLocation = CLLocation()
        let anotherLocation = CLLocation()
        
        locationService.delegate = LocationServiceDelegateMock(expectedLocation: anotherLocation)
        
        let locationArray = [aLocation, anotherLocation]
        
        locationService.locationManager(mockLocationManager, didUpdateLocations: locationArray)
        wait(for: [expectation], timeout: 1.0)
    }
}
