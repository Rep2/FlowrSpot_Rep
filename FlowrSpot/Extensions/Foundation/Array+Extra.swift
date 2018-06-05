//
//  Array+Extra.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Array.Element? {
    guard index >= 0 && index < count else { return nil }
    return self[index]
  }
}
