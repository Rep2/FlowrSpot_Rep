//
//  HomeViewController.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
  func displayFlowers(_ flowers: [Flower])
  func displayError(_ error: RemoteResourceError)
}

class HomeViewController: UIViewController {
  var interactor: HomeBusinessLogic?
  var router: HomeRoutingLogic?
  private let flowersDataSource = FlowersDataSource()
  private let collectionViewDimensions = FlowerCollectionViewItemDimenson(numberOfItemsInRow: 2, insets: 8)
  private let headerViewHeight: CGFloat = 255
  private let headerView = HomeHeaderView.autolayoutView()
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).autoLayoutView()
  private let rightBarButton = UIButton(type: .custom)
  private let emptyView = EmptyView.autolayoutView()
  
  init(delegate: HomeRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    loadData()
  }
}

// MARK: - Display Logic
extension HomeViewController: HomeDisplayLogic {
  func displayFlowers(_ flowers: [Flower]) {
    flowersDataSource.update(flowers: flowers)
    collectionView.reloadData()
    emptyView.isHidden = true
  }
  
  func displayError(_ error: RemoteResourceError) {
    let alert = UIAlertController(title: "general_error".localized(), message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
    emptyView.isHidden = false
  }
}

// MARK: - UIStyling
extension HomeViewController: UIStyling {
  func setupViews() {
    navigationItem.title = "general_app_name".localized()
    
    view.addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.keyboardDismissMode = .onDrag
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
    collectionView.register(FlowerCollectionViewCell.self)
    
    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.scrollDirection = .vertical
      flowLayout.sectionInset = collectionViewDimensions.sectionInset
      flowLayout.minimumLineSpacing = collectionViewDimensions.lineSpacing
      flowLayout.minimumInteritemSpacing = collectionViewDimensions.interItemSpacing
    }
    
    view.addSubview(headerView)
    
    rightBarButton.setImage(#imageLiteral(resourceName: "plIconSearch"), for: .normal)
    rightBarButton.addTarget(self, action: #selector(barButtonPressed), for: .touchUpInside)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    
    view.addSubview(emptyView)
    emptyView.text = "placeholder_no_content".localized()
  }
  
  func setupConstraints() {
    headerView.snp.makeConstraints { (make) in
      make.leading.top.trailing.equalToSuperview()
      make.height.equalTo(headerViewHeight)
    }
    
    collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    emptyView.snp.makeConstraints { (make) in
      make.top.equalTo(headerView.snp.bottom)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}

// MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return flowersDataSource.numberOfSections()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flowersDataSource.numberOfRows(in: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let row = flowersDataSource.row(at: indexPath) else {
      Logger.error("No availible row in dataSource at \(indexPath)")
      return UICollectionViewCell()
    }
    
    let cell = collectionView.dequeueReusableCell(FlowerCollectionViewCell.self, at: indexPath)
    switch row {
    case let .flower(entity):
      cell.setFlower(entity)
    }
    return cell
  }
}

// MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionViewDimensions.sizeForItem(at: indexPath, for: collectionView)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let row = flowersDataSource.row(at: indexPath) else {
      Logger.error("No availible row in dataSource at \(indexPath)")
      return
    }
    switch row {
    case let .flower(entity):
      router?.navigateToFlowerDetails(flower: entity)
    }
  }
}

// MARK: - UIScrollView Delegate
extension HomeViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffset = -scrollView.contentOffset.y
    
    let percentage = 1 - (contentOffset / headerViewHeight)
    
    var headerViewTranslation = -percentage * headerViewHeight
    if headerViewTranslation > 0 {
      headerViewTranslation = 0 // lock headerView
    }
    
    headerView.transform = CGAffineTransform.identity.translatedBy(x: 0, y: headerViewTranslation)
    
    if percentage > 0.75 {
      showSearchButton()
    } else {
      hideSearchButton()
    }
  }
}

// MARK: - Private Methods
private extension HomeViewController {
  func loadData() {
    interactor?.fetchFlowers()
  }
  
  @objc func barButtonPressed() {
    collectionView.setContentOffset(CGPoint(x: 0, y: -headerViewHeight), animated: true)
  }
  
  func showSearchButton() {
    guard rightBarButton.alpha == 0 else { return }
    
    let transform = CATransform3DRotate(CATransform3DIdentity, 0, 1, 0, 0)
    UIView.animate(withDuration: 0.3) {
      self.rightBarButton.layer.transform = transform
      self.rightBarButton.alpha = 1
    }
  }
  
  func hideSearchButton() {
    guard rightBarButton.alpha == 1 else { return }
    
    let transform = CATransform3DRotate(CATransform3DIdentity, .pi, 1, 0, 0)
    UIView.animate(withDuration: 0.3) {
      self.rightBarButton.alpha = 0
      self.rightBarButton.layer.transform = transform
    }
  }
}
