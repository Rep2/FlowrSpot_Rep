import ReusableDataSource
import UIKit

protocol FlowerDetailsDisplayLogic: class {
  func displayFlowerDetails(_ flowerDetails: FlowerDetails)
  func presentSightings(_ anyTableViewPresentableViewModel: [AnyTableViewPresentableViewModel])
  func displayError(_ error: RemoteResourceError)
}

class FlowerDetailsViewController: UIViewController {
  lazy var headerView: FlowerDetailsHeaderView = {
    let headerView = FlowerDetailsHeaderView.autolayoutView()

    headerView.setup()

    return headerView
  }()

  let headerViewHeight: CGFloat = 255

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)

    tableView.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self.reusableDataSource
    tableView.contentInset = UIEdgeInsets(top: self.headerViewHeight, left: 0, bottom: 0, right: 0)

    return tableView
  }()

  private lazy var emptyView: EmptyView = {
    let emptyView = EmptyView.autolayoutView()

    emptyView.text = "placeholder_no_content".localized()
    emptyView.isHidden = true

    return emptyView
  }()

  private lazy var headerViewScrollHandler: HeaderViewScrollHandler = {
    return HeaderViewScrollHandler(headerViewHeight: self.headerViewHeight, headerView: self.headerView)
  }()

  let interactor: FlowerDetailsInteractor

  let reusableDataSource = ReusableTableViewDataSource()

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

    view.addSubview(tableView)
    view.addSubview(headerView)
    view.addSubview(emptyView)
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { (make) in
      make.leading.top.trailing.equalToSuperview()
    }

    tableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }

    emptyView.snp.makeConstraints { (make) in
      make.top.equalTo(headerView.snp.bottom)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}

// MARK: - Display Logic
extension FlowerDetailsViewController: FlowerDetailsDisplayLogic {
  func displayFlowerDetails(_ flowerDetails: FlowerDetails) {
    headerView.present(flowerDetails: flowerDetails)
  }

  func presentSightings(_ anyTableViewPresentableViewModel: [AnyTableViewPresentableViewModel]) {
    emptyView.isHidden = !anyTableViewPresentableViewModel.isEmpty

    reusableDataSource.present(presentableViewModels: anyTableViewPresentableViewModel, on: tableView)
  }

   func displayError(_ error: RemoteResourceError) {
    let alert = UIAlertController(title: "general_error".localized(), message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

// MARK: - UITableView Delegate
extension FlowerDetailsViewController: UITableViewDelegate {

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
    interactor.fetchFlowerDetails(for: flower.id)
    interactor.fetchSightings(for: flower.id)
  }
}
