struct FlowerDetailsResponse: Decodable {
  let features: [String]
  let description: String

  let flowerResponse: FlowerResponse

  enum RootCodingKeys: String, CodingKey {
    case flower
  }

  enum CodingKeys: String, CodingKey {
    case features
    case description
    case id
    case name
    case latinName = "latin_name"
    case sightings
    case profilePicture = "profile_picture"
    case isFavorite = "favorite"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: RootCodingKeys.self)
      .nestedContainer(keyedBy: CodingKeys.self, forKey: .flower)

    features = try container.decode([String].self, forKey: .features)
    description = try container.decode(String.self, forKey: .description)

    let id = try container.decode(Int.self, forKey: .id)
    let name = try container.decode(String.self, forKey: .name)
    let latinName = try container.decode(String.self, forKey: .latinName)
    let sightings = try container.decode(Int.self, forKey: .sightings)
    let profilePicture = try container.decode(String.self, forKey: .profilePicture)
    let isFavorite = try container.decode(Bool.self, forKey: .isFavorite)

    flowerResponse = FlowerResponse(id: id, name: name, latinName: latinName, sightings: sightings, profilePicture: profilePicture, isFavorite: isFavorite)
  }
}
