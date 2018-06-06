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
    // Test as no flowers have sightings
    let sightings = [
      Sighting(id: 7, name: "Test", description: "aasda1 acasdw qf asdqsf oa dasd", picture: "", likesCount: 5, commentsCount: 9, createdDate: "", user: User(id: 9, fullName: "Ivan Rep")),
      Sighting(id: 7, name: "Test 2", description: "aasda1 ajsdqiwoeiqwuoeqidjoaksjlaksdjascjas qf asdqsf oa dasdasdasdasdasfafq33 ;dfjdifj2o3hopaosdoasho ",
               picture: "", likesCount: 1, commentsCount: 0, createdDate: "", user: User(id: 9, fullName: "Ivan Rep"))
    ]

     let reusableViewModel = sightings.map { sighting in
      ReusableViewModel<SightingTableViewCell>(viewModel: sighting).anyPresentable
    }

    viewController?.presentSightings(reusableViewModel)
  }

  func presentError(_ error: RemoteResourceError) {
    viewController?.displayError(error)
  }
}
