//
//  DetailVenueViewControllerTests.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
@testable import FourSquare

class DetailVenueViewControllerTests: XCTestCase {

    func testLoadView() {
        let fourSquareService = FourSquareServiceMock()
        
        let vc = DetailVenueViewController(venue: VenueMock.venue(), fourSquareService: fourSquareService)
        _ = vc.view
        
        let imageComponent = vc.stackView.arrangedSubviews[0]
        let titleComponent  = vc.stackView.arrangedSubviews[1]
        let addressComponent  = vc.stackView.arrangedSubviews[2]
        let descriptionComponent  = vc.stackView.arrangedSubviews[3]
        let rankingComponent  = vc.stackView.arrangedSubviews[4]
        let socialComponent  = vc.stackView.arrangedSubviews[5]
        
        XCTAssertEqual(vc.stackView.arrangedSubviews.count, 6)
        XCTAssertTrue(imageComponent.isKind(of: DetailVenueMainPhoto.self))
        XCTAssertTrue(titleComponent.isKind(of: DetailVenueTitle.self))
        XCTAssertTrue(addressComponent.isKind(of: DetailVenueAddress.self))
        XCTAssertTrue(descriptionComponent.isKind(of: DetailVenueDescription.self))
        XCTAssertTrue(rankingComponent.isKind(of: DetailVenueRanking.self))
        XCTAssertTrue(socialComponent.isKind(of: DetailVenueSocialBlock.self))
    }
    
}
