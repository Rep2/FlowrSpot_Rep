import Foundation

protocol FlowerDetailsBusinessLogic {
  func fetchFlowerDetails(flowerId: Int)
}

class FlowerDetailsInteractor {
  var presenter: HomePresentationLogic?
  var flowerDetailsWorker = FlowersDetailsWorker()
}

// MARK: - Business Logic
extension FlowerDetailsInteractor: FlowerDetailsBusinessLogic {
  func fetchFlowerDetails(flowerId: Int) {
    flowerDetailsWorker.execute(flowerId: flowerId, success: { flowerDetails in
      // TODO: - Implement logic
    }, failure: { error in
      self.presenter?.presentFlowersError(error)
    })
  }
}
