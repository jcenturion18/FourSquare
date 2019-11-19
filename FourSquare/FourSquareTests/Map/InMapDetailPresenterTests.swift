//
//  InMapDetailPresenterTests.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
import MapKit
@testable import FourSquare

class InMapDetailPresenterTests: XCTestCase {
    
    func testShowDetail() {
        let inMapDetailPresenter = InMapDetailPresenter()
        let parent = UIView()
        inMapDetailPresenter.setUp(parentView: parent, delegate: InMapDetailPresenterDelegateMock())
        
        let venue = Venue(id: "id", name: "Name", location: Location(lat: 40, lng: 40, address: nil, city: nil, state: nil, country: nil, formattedAddress: ["Street", "Country"]), contact: nil, rating: nil, ratingColor: nil, ratingSignals: nil, description: nil, bestPhoto: nil, likes: nil)
        inMapDetailPresenter.showDetail(withVenue: venue)
        
        XCTAssertEqual(inMapDetailPresenter.detailView?.titleLabel.text, "Name")
        XCTAssertEqual(inMapDetailPresenter.detailView?.additionalInfoLabel.text, "Street\nCountry")
        XCTAssertEqual(inMapDetailPresenter.detailView?.center, CGPoint(x: 207.0, y: 130.5))
        XCTAssertEqual(parent.subviews.count, 1)
        
    }
    
    func testHideDetail() {
        let inMapDetailPresenter = InMapDetailPresenter()
        let parent = UIView()
        inMapDetailPresenter.setUp(parentView: parent, delegate: InMapDetailPresenterDelegateMock())
        
        inMapDetailPresenter.hideDetail()
        
        XCTAssertEqual(inMapDetailPresenter.detailView?.center, CGPoint(x: 207.0, y: 652.5))
        XCTAssertEqual(parent.subviews.count, 1)
        
    }

}

class InMapDetailPresenterDelegateMock: InMapDetailPresenterDelegate{
    func navigateToVenueDetail(forVenue venue: Venue) {
    }
}
