//
//  SectionType.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol SectionType {
  associatedtype Row: RowType
  var rows: [Row] { get }
}

extension SectionType {
  func row(at index: Int) -> Self.Row? {
    return rows[safe: index]
  }
}

extension Array where Array.Element: RowType {
  subscript(safe index: Int) -> Array.Element? {
    guard index >= 0 && index < count else { return nil }
    return self[index]
  }
}
