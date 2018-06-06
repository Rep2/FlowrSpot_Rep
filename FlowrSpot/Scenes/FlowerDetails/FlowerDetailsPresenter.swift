import ReusableDataSource
import UIKit

protocol FlowerDetailsPresentationLogic {
  func presentFlowerDetails(_ flowerDetails: FlowerDetails)
  func presentSightings(_ sightings: [Sighting])
  func presentError(_ error: RemoteResourceError)
}

class FlowerDetailsPresenter {
  weak var viewController: FlowerDetailsDisplayLogic?
}

// MARK: - Presentation Logic
extension FlowerDetailsPresenter: FlowerDetailsPresentationLogic {
  func presentFlowerDetails(_ flowerDetails: FlowerDetails) {
    viewController?.displayFlowerDetails(flowerDetails)
  }

  func presentSightings(_ sightings: [Sighting]) {
     let reusableViewModel = sightings.map { sighting in
      ReusableViewModel<SightingTableViewCell>(viewModel: sighting).anyPresentable
    }

    viewController?.presentSightings(reusableViewModel)
  }

  func presentError(_ error: RemoteResourceError) {
    viewController?.displayError(error)
  }
}
