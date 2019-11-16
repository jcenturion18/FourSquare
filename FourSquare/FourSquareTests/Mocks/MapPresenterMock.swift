//
//  MapPresenterMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import XCTest
import MapKit
@testable import FourSquare

class MapPresenterMock: MapPresenter {
    let expectation:XCTestExpectation?
    init(expectation:XCTestExpectation?) {
        self.expectation = expectation
    }
    
    override func center(onLocation location: CLLocation) {}
    
    override func update(with venues: [Venue]?) {
        expectation?.fulfill()
    }
}
