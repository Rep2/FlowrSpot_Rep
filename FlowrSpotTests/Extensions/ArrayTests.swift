//
//  FlowersDownloaderTests.swift
//  FlowrSpotTest
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class ArrayTests: XCTestCase {
  
  private let array = [0, 1, 2, 3]
  
  func testSafeSubscript() {
    XCTAssertNil(array[safe: -1])
    XCTAssertNil(array[safe: array.count])
    for i in 0..<array.count {
      XCTAssertEqual(array[safe: i], i)
    }
  }
}
