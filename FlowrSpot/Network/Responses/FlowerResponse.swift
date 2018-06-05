//
//  FlowerMode.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import ObjectMapper

class FlowerResponse: Mappable {
  private(set) var id = -1
  private(set) var name = ""
  private(set) var latinName = ""
  private(set) var sightings = -1
  private(set) var profilePicture = ""
  private(set) var isFavorite = false
  
  required convenience init(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    latinName <- map["latin_name"]
    sightings <- map["sightings"]
    profilePicture <- map["profile_picture"]
    isFavorite <- map["favorite"]
  }
}
