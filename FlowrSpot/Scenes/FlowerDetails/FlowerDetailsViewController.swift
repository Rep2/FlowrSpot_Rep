import UIKit

class FlowerDetailsViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    setupConstraints()
  }
}

extension FlowerDetailsViewController: UIStyling {
  func setupViews() {
    view.backgroundColor = .white
    
    title = NSLocalizedString("Flower details", comment: "Flower details screen title")
  }

  func setupConstraints() {

  }
}
