import UIKit

protocol FlowerDetailsPresentationLogic {
  func presentFlowerDetails(_ flowerDetails: FlowerDetails)
  func presentFlowersError(_ error: RemoteResourceError)
}

class FlowerDetailsPresenter {
  weak var viewController: FlowerDetailsDisplayLogic?
}

// MARK: - Presentation Logic
extension FlowerDetailsPresenter: FlowerDetailsPresentationLogic {
  func presentFlowerDetails(_ flowerDetails: FlowerDetails) {
    viewController?.displayFlowerDetails(flowerDetails)
  }

  func presentFlowersError(_ error: RemoteResourceError) {
    viewController?.displayError(error)
  }
}
