struct SightingsWorker {

  var downloader = FlowersDownloader()

  func execute(flowerId: Int, success: RestClient.SuccessCompletion<[Sighting]>, failure: RestClient.FailureCompletion) {
    downloader.fetchSightings(for: flowerId, success: { response in

      let sightings = response.map { sightingResponse -> Sighting in
        let user = User(id: sightingResponse.userResponse.id, fullName: sightingResponse.userResponse.fullName)

        return Sighting(
          id: sightingResponse.id,
          name: sightingResponse.name,
          description: sightingResponse.description,
          picture: sightingResponse.picture,
          likesCount: sightingResponse.likesCount,
          commentsCount: sightingResponse.commentsCount,
          createdDate: sightingResponse.createdDate,
          user: user
        )
      }

      success?(sightings)
    }, failure: failure)
  }
}
