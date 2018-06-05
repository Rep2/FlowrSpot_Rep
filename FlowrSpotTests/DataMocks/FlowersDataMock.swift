//
//  File.swift
//  FlowrSpotTests
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation
@testable import FlowrSpot

class FlowersDataMock {
  func mockFlowerEntities() -> [Flower] {
    return FlowerResponseMapper.map(response: mockFlowerResponses())
  }
  
  func mockFlowerResponses() -> [FlowerResponse] {
    do {
      let json = try laodJsonFromFile("flowers")
      return FlowerResponse.parseArray(json, key: "flowers")
    }
    catch {
      print(error.localizedDescription)
    }
    return []
  }
}

private extension FlowersDataMock {
  func laodJsonFromFile(_ file: String) throws -> Any {
    guard let path = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") else { throw RemoteResourceError.generic }
    
    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
    return jsonResult
  }
}
