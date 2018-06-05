//
//  RowType.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol RowType {
  var reuseIdentifier: String { get }
}

extension RowType {
  var reuseIdentifier: String {
    return String(describing: self)
  }
}
