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
  
  func execute(flowerId: Int, success: RestClient.SuccessCompletion<FlowerDetailsResponse>, failure: RestClient.FailureCompletion) {
    downloader.fetchFlowerDetails(flowerId: flowerId, success: { (response) in
      success?(response) // TODO: - Map to entity
    }, failure: failure)
  }
}
