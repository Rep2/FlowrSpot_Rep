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
}

class HomeInteractor {
  var presenter: HomePresentationLogic?
  var getFlowersWorker = GetFlowersWorker()
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
}
