import Foundation

protocol FlowerDetailsBusinessLogic {
  func fetchFlowerDetails(for flowerId: Int)
  func fetchSightings(for flowerId: Int)
}

class FlowerDetailsInteractor {
  var presenter: FlowerDetailsPresentationLogic?

  var flowerDetailsWorker = FlowersDetailsWorker()
  var sightingsWorker = SightingsWorker()
}

// MARK: - Business Logic
extension FlowerDetailsInteractor: FlowerDetailsBusinessLogic {
  func fetchFlowerDetails(for flowerId: Int) {
    flowerDetailsWorker.execute(
      flowerId: flowerId,
      success: { flowerDetails in
        self.presenter?.presentFlowerDetails(flowerDetails)
    }, failure: { error in
      self.presenter?.presentError(error)
    })
  }

  func fetchSightings(for flowerId: Int) {
    sightingsWorker.execute(
      flowerId: flowerId,
      success: { sightings in
        self.presenter?.presentSightings(sightings)
    }, failure: { error in
      self.presenter?.presentError(error)
    })
  }
}
