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
