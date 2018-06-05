//
//  HomePresenter.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
  func presentFlowers(_ flowers: [Flower])
  func presentFlowersError(_ error: RemoteResourceError)
}

class HomePresenter {
  weak var viewController: HomeDisplayLogic?
}

// MARK: - Presentation Logic
extension HomePresenter: HomePresentationLogic {
  func presentFlowers(_ flowers: [Flower]) {
    viewController?.displayFlowers(flowers)
  }
  
  func presentFlowersError(_ error: RemoteResourceError) {
    viewController?.displayError(error)
  }
}
