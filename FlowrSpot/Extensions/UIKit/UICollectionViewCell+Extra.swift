//
//  UICollectionViewCell+Extra.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
