//
//  HomeInteractor.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
  func fetchFlowers()
  func fetchFlowerDetails(flowerId: Int)
}

class HomeInteractor {
  var presenter: HomePresentationLogic?
  var getFlowersWorker = GetFlowersWorker()
  var flowerDetailsWorker = FlowersDetailsWorker()
}

// MARK: - Business Logic
extension HomeInteractor: HomeBusinessLogic {
  func fetchFlowers() {
    getFlowersWorker.execute(success: { (flowers) in
      self.presenter?.presentFlowers(flowers)
    }, failure: { error in
      self.presenter?.presentFlowersError(error)
    })
  }
  
  func fetchFlowerDetails(flowerId: Int) {
    flowerDetailsWorker.execute(flowerId: flowerId, success: { (_) in
      // TODO: - Implement logic
    }, failure: { error in
      self.presenter?.presentFlowersError(error)
    })
  }
}
