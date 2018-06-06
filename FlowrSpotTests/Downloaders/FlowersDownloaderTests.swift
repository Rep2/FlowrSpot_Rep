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

  func testFetchFlowersDetails() {
    let promise = expectation(description: "Completion handler invoked")

    flowersDownloader.fetchFlowerDetails(flowerId: 1, success: { (response) in
      XCTAssertNotNil(response)
      promise.fulfill()
    }, failure: { error in
      XCTFail("Request should succeed")
      promise.fulfill()
    })
    waitForExpectations(timeout: 5, handler: nil)
  }

  func testFetchFlowersSightings() {
    let promise = expectation(description: "Completion handler invoked")

    flowersDownloader.fetchSightings(for: 1, success: { (response) in
      XCTAssertNotNil(response)
      promise.fulfill()
    }, failure: { error in
      XCTFail("Request should succeed")
      promise.fulfill()
    })
    waitForExpectations(timeout: 5, handler: nil)
  }
}
