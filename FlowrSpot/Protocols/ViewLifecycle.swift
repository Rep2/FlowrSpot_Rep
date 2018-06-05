//
//  ViewLifecycle.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

protocol ViewLifecycle {
  func setupViews()
  func setupConstraints()
}

extension ViewLifecycle where Self: UIView {
  func setup() {
    backgroundColor = .white
    setupViews()
    setupConstraints()
  }
}
