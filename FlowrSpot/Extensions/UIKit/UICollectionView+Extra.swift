//
//  UICollectionView+Extra.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

extension UICollectionView {
  func register<T: UICollectionViewCell>(_ type: T.Type) {
    register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type, at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      Logger.error("Could not dequeue cell with identifier: \(T.reuseIdentifier). Creating new instance.")
      return T()
    }
    return cell
  }
}
