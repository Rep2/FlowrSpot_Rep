//
//  FlowersDetailsWorker.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

struct FlowersDetailsWorker {
  
  var downloader = FlowersDownloader()

  func execute(flowerId: Int, success: RestClient.SuccessCompletion<FlowerDetails>, failure: RestClient.FailureCompletion) {
    downloader.fetchFlowerDetails(flowerId: flowerId, success: { response in
      guard let flower = FlowerResponseMapper.transform(response: response.flowerResponse) else {
        failure?(RemoteResourceError.invalidJson)

        return
      }

      success?(
        FlowerDetails(
          features: response.features,
          description: response.description,
          flower: flower
        )
      )
    }, failure: failure)
  }
}
