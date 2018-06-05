//
//  DataSource.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

protocol DataSource {
  associatedtype Section: SectionType
  var sections: [Section] { get set }
}

extension DataSource {
  func section(at index: Int) -> Self.Section? {
    return sections[safe: index]
  }
  
  func numberOfSections() -> Int {
    return sections.count
  }
  
  func numberOfRows(in section: Int) -> Int {
    return self.section(at: section)?.rows.count ?? 0
  }
  
  func row(at indexPath: IndexPath) -> Self.Section.Row? {
    return sections[safe: indexPath.section]?.row(at: indexPath.row)
  }
}

extension Array where Array.Element: SectionType {
  subscript(safe index: Int) -> Array.Element? {
    guard index >= 0 && index < count else { return nil }
    return self[index]
  }
}
