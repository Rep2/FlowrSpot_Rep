struct Sighting {
  let id: Int
  let name: String
  let description: String
  let picture: String
  let likesCount: Int
  let commentsCount: Int
  let createdDate: String

  let user: User
}

struct User {
  let id: Int
  let fullName: String
}
