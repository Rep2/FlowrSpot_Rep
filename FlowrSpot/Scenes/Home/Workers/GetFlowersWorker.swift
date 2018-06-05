//
//  FlowersWorker.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

struct GetFlowersWorker {
  
  var downloader = FlowersDownloader()
  
  func execute(success: RestClient.SuccessCompletion<[Flower]>, failure: RestClient.FailureCompletion) {
    downloader.fetchFlowersList(success: { (flowers) in
      success?(FlowerResponseMapper.map(response: flowers))
    }, failure: failure)
  }
}
