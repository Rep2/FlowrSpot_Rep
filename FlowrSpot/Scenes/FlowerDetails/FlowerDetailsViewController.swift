import UIKit

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

    view.addSubview(collectionView)
    view.addSubview(headerView)

    headerView.present(flower: flower)
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { (make) in
      make.leading.top.trailing.equalToSuperview()
      make.height.equalTo(headerViewHeight)
    }

    collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
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
    cell.setFlower(flower)
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
