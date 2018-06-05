//
//  FlowersMapperTests.swift
//  FlowrSpotTests
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowersMapperTests: XCTestCase {  
  private let flowersResponse = FlowersDataMock().mockFlowerResponses()
  
  func testMapping() {
    let entities = FlowerResponseMapper.map(response: flowersResponse)
    XCTAssertEqual(entities.count, flowersResponse.count)
    
    for i in 0..<entities.count {
      let entity = entities[i]
      let response = flowersResponse[i]
      XCTAssertEqual(entity.name, response.name)
      XCTAssertEqual(entity.latinName, response.latinName)
      XCTAssertEqual(entity.sightings, response.sightings)
      XCTAssertEqual(entity.isFavorite, response.isFavorite)
      XCTAssertEqual(entity.url, "http:" + response.profilePicture)
    }
  }
}
