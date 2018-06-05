//
//  MapperProtocol.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol ResponseMapper {
  associatedtype T
  associatedtype U
  
  static func map(response: [T]) -> [U]
  
  // If you return nil, then map will ignore your data
  static func transform(response: T) -> U?
}

extension ResponseMapper {
  static func map(response: [T]) -> [U] {
    return response.compactMap(transform)
  }
}
