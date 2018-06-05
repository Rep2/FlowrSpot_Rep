//
//  NavigationViewController.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 17/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

// MARK: - UIStyling
extension NavigationViewController: UIStyling {
  func setupViews() {
    navigationBar.barTintColor = .white
    navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.custom(type: .bold, size: 17),
                                         NSAttributedStringKey.foregroundColor: UIColor.flowrPink]
    navigationBar.setBackgroundImage(UIImage(), for: .top, barMetrics: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.tintColor = .lightGray
    navigationBar.layer.masksToBounds = false
    
    let backgroundColor = UIColor.white
    navigationBar.barTintColor = backgroundColor
    navigationBar.backgroundColor = backgroundColor
    navigationBar.isTranslucent = false
  }
  
  func setupConstraints() {
    
  }
}
