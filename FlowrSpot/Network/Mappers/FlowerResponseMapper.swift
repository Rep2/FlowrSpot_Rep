//
//  FlowerResponseMapper.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import Foundation

final class FlowerResponseMapper: ResponseMapper {
  static func transform(response: FlowerResponse) -> Flower? {
    return Flower(
      id: response.id,
      name: response.name,
      latinName: response.latinName,
      sightings: response.sightings,
      url: "http:" + response.profilePicture,
      isFavorite: response.isFavorite
    )
  }
}
