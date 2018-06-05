//
//  FlowersDataSource.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

class FlowersDataSource: DataSource {
  var sections = [FlowersSection]()
  private var flowers = [Flower]()
  
  func update(flowers: [Flower]) {
    self.flowers = flowers
    buildSections()
  }
}

private extension FlowersDataSource {
  func buildSections() {
    let rows = flowers.map(FlowersRow.flower)
    sections = [FlowersSection(rows: rows)]
  }
}
