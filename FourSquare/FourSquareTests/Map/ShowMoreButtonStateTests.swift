//
//  ShowMoreButtonStateTests.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import XCTest
@testable import FourSquare

class ShowMoreButtonStateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStateShow() {
        let view = UIView()
        _ = ShowMoreButtonStateShow().apply(view)
        XCTAssertEqual(view.alpha, 1)
    }

    func testStateHide() {
        let view = UIView()
        _ = ShowMoreButtonStateHide().apply(view)
        XCTAssertEqual(view.alpha, 0)
    }

}
