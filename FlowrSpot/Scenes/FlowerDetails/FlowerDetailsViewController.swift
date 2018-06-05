import UIKit

class FlowerDetailsViewController: UIViewController {
  lazy var headerView: FlowerDetailsHeaderView = {
    let headerView = FlowerDetailsHeaderView.autolayoutView()

    headerView.setup()

    return headerView
  }()

  let headerViewHeight = 255

  let flower: Flower

  init(flower: Flower) {
    self.flower = flower

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

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

    view.addSubview(headerView)

    headerView.present(flower: flower)
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { (make) in
      make.leading.top.trailing.equalToSuperview()
      make.height.equalTo(headerViewHeight)
    }
  }
}
