import UIKit

protocol FlowerDetailsDisplayLogic: class {
  func displayFlowerDetails(_ flowerDetails: FlowerDetails)
  func displayError(_ error: RemoteResourceError)
}

class FlowerDetailsViewController: UIViewController {
  lazy var headerView: FlowerDetailsHeaderView = {
    let headerView = FlowerDetailsHeaderView.autolayoutView()

    headerView.setup()

    return headerView
  }()

  let headerViewHeight: CGFloat = 255

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).autoLayoutView()

    collectionView.backgroundColor = .white
    collectionView.keyboardDismissMode = .onDrag
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.contentInset = UIEdgeInsets(top: self.headerViewHeight, left: 0, bottom: 0, right: 0)
    collectionView.register(FlowerCollectionViewCell.self)

    return collectionView
  }()

  private lazy var headerViewScrollHandler: HeaderViewScrollHandler = {
    return HeaderViewScrollHandler(headerViewHeight: self.headerViewHeight, headerView: self.headerView)
  }()

  let interactor: FlowerDetailsInteractor

  init(flower: Flower) {
    self.interactor = FlowerDetailsInteractor()

    super.init(nibName: nil, bundle: nil)

    let presenter = FlowerDetailsPresenter()
    interactor.presenter = presenter
    presenter.viewController = self

    loadData(flower: flower)
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

    view.addSubview(collectionView)
    view.addSubview(headerView)
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { (make) in
      make.leading.top.trailing.equalToSuperview()
    }

    collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}

// MARK: - Display Logic
extension FlowerDetailsViewController: FlowerDetailsDisplayLogic {
  func displayFlowerDetails(_ flowerDetails: FlowerDetails) {
    headerView.present(flowerDetails: flowerDetails)
  }

   func displayError(_ error: RemoteResourceError) {
    let alert = UIAlertController(title: "general_error".localized(), message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

// MARK: - UICollectionView DataSource
extension FlowerDetailsViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1//flowersDataSource.numberOfSections()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 320//flowersDataSource.numberOfRows(in: section)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    guard let row = flowersDataSource.row(at: indexPath) else {
//      Logger.error("No availible row in dataSource at \(indexPath)")
//      return UICollectionViewCell()
//    }

    let cell = collectionView.dequeueReusableCell(FlowerCollectionViewCell.self, at: indexPath)

//    switch row {
//    case let .flower(entity):
//      cell.setFlower(entity)
//    }
    return cell
  }
}

// MARK: - UICollectionView Delegate
extension FlowerDetailsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

}

// MARK: - UIScrollView Delegate
extension FlowerDetailsViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    headerViewScrollHandler.scrollViewDidScroll(scrollView)
  }
}

// MARK: - Private Methods
private extension FlowerDetailsViewController {
  func loadData(flower: Flower) {
    interactor.fetchFlowerDetails(flowerId: flower.id)
  }
}
