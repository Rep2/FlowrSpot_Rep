struct FlowersResponse: Codable {
  let flowers: [FlowerResponse]
}

struct FlowerResponse: Codable {
  let id: Int
  let name: String
  let latinName: String
  let sightings: Int
  let profilePicture: String
  let isFavorite: Bool

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case latinName = "latin_name"
    case sightings
    case profilePicture = "profile_picture"
    case isFavorite = "favorite"
  }
}
