//
//  CLLocationManagerMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit
import XCTest

class CLLocationManagerMock: CLLocationManager {

    let expectation:XCTestExpectation
    init(expectation:XCTestExpectation) {
        self.expectation = expectation
    }
    
    override func stopUpdatingLocation() {
        expectation.fulfill()
    }
}
