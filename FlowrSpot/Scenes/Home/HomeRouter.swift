//
//  HomeRouter.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol HomeRoutingLogic {
  func navigateToFlowerDetails(flower: Flower)
}

protocol HomeRouterDelegate: class {
  
}

class HomeRouter {
  weak var viewController: HomeViewController?
  weak var delegate: HomeRouterDelegate?
}

// MARK: - Routing Logic
extension HomeRouter: HomeRoutingLogic {
  func navigateToFlowerDetails(flower: Flower) {
    viewController?.navigationController?.pushViewController(FlowerDetailsViewController(flower: flower), animated: true)
  }
}
