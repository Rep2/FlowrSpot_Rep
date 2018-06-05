//
//  FlowersDownloaderTests.swift
//  FlowrSpotTest
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowersDownloaderTests: XCTestCase {
  private let flowersDownloader = FlowersDownloader()
  
  func testFetchFlowersList() {
    let promise = expectation(description: "Completion handler invoked")
    
    flowersDownloader.fetchFlowersList(success: { (response) in
      XCTAssertNotNil(response)
      promise.fulfill()
    }, failure: { error in
      XCTFail("Request should succeed")
      promise.fulfill()
    })
    waitForExpectations(timeout: 5, handler: nil)
  }
}
