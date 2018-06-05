//
//  FlowersDownloader.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

final class FlowersDownloader {
  func fetchFlowersList(success: RestClient.SuccessCompletion<[FlowerResponse]>, failure: RestClient.FailureCompletion) {
    RestClient.shared.request(FlowerRequests.flowersList, version: .v1, success: { json in
      let flowers = FlowerResponse.parseArray(json, key: "flowers")
      success?(flowers)
    }, failure: failure)
  }
  
  func fetchFlowerDetails(flowerId: Int, success: RestClient.SuccessCompletion<FlowerDetailsResponse>, failure: RestClient.FailureCompletion) {
    RestClient.shared.request(FlowerRequests.flowerDetails(flowerid: flowerId), version: .v1, success: { (json) in
      if let flowerDetails = FlowerDetailsResponse.parse(json, key: "flower") {
        success?(flowerDetails)
      } else {
        failure?(RemoteResourceError.invalidJson)
      }
    }, failure: failure)
  }
}
