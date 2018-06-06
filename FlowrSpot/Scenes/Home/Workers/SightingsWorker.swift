struct SightingsWorker {

  var downloader = FlowersDownloader()

  func execute(flowerId: Int, success: RestClient.SuccessCompletion<FlowerDetails>, failure: RestClient.FailureCompletion) {
    downloader.fetchFlowerDetails(flowerId: flowerId, success: { response in
      guard let flower = FlowerResponseMapper.transform(response: response.flowerResponse) else {
        failure?(RemoteResourceError.invalidJson)

        return
      }

      success?(
        FlowerDetails(
          features: response.features,
          description: response.description,
          flower: flower
        )
      )
    }, failure: failure)
  }
}
