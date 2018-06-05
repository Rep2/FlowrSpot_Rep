//
//  UIView+Extra.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

extension UIView {
  class func autolayoutView() -> Self {
    let instance = self.init()
    instance.translatesAutoresizingMaskIntoConstraints = false
    return instance
  }
  
  func autoLayoutView() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
}
