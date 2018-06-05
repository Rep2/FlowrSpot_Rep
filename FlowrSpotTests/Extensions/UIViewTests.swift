//
//  UIViewExtensionsTests.swift
//  FlowrSpotTests
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class UIViewTests: XCTestCase {
  func testIsAutoLayoutView() {
    let autolayoutView = UIView.autolayoutView()
    XCTAssertFalse(autolayoutView.translatesAutoresizingMaskIntoConstraints)
  }
}
