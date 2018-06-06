import Foundation

struct SightingsResponse: Codable {
  let id: Int
  let name: String
  let description: String
  let picture: String
  let likesCount: Int
  let commentsCount: Int
  let createdDate: Date

  let userResponse: UserResponse

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case description
    case picture
    case likesCount = "likes_count"
    case commentsCount = "comments_count"
    case createdDate = "created_at"
    case userResponse = "user"
  }
}

  struct UserResponse: Codable {
    let id: Int
    let fullName: String
}
