import Storable
import Foundation

final class FlowersDownloader {
  func fetchFlowersList(success: RestClient.SuccessCompletion<[FlowerResponse]>, failure: RestClient.FailureCompletion) {
    RestClient.shared.request(FlowerRequests.flowersList, version: .v1, success: { json in
      do {
        let flowersResponse = try FlowersResponse.decode(data: json)

        success?(flowersResponse.flowers)
      } catch {
        failure?(RemoteResourceError.invalidJson)
      }
    }, failure: failure)
  }
  
  func fetchFlowerDetails(flowerId: Int, success: RestClient.SuccessCompletion<FlowerDetailsResponse>, failure: RestClient.FailureCompletion) {
    RestClient.shared.request(FlowerRequests.flowerDetails(flowerid: flowerId), version: .v1, success: { (json) in
      do {
        let flowerDetailsResponse = try FlowerDetailsResponse.decode(data: json)

        success?(flowerDetailsResponse)
      } catch {
        failure?(RemoteResourceError.invalidJson)
      }
    }, failure: failure)
  }
}
