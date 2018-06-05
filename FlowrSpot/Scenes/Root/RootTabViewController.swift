//
//  RootTabViewController.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController {
  
  init() {
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

// MARK: - UI Styling

extension RootTabViewController: UIStyling {
  func setupViews() {
    tabBar.barTintColor = .white
    tabBar.tintColor = .red
    
    UITabBarItem.appearance().setTitleTextAttributes([:], for: .normal)
    
    let homeViewController = HomeViewController(delegate: nil)
    let homeNavigationController = NavigationViewController(rootViewController: homeViewController)
    let viewControllers = [homeNavigationController, UIViewController(), UIViewController(), UIViewController()]
    setViewControllers(viewControllers, animated: true)
    
    if let items = tabBar.items, items.count == viewControllers.count {
      setupTabBarItem(items[0], using: #imageLiteral(resourceName: "favoritesIcons"), title: nil)
      setupTabBarItem(items[1], using: #imageLiteral(resourceName: "commentIcon"), title: nil)
      setupTabBarItem(items[2], using: #imageLiteral(resourceName: "sightingListIcon"), title: nil)
      setupTabBarItem(items[3], using: #imageLiteral(resourceName: "newSightingIcon"), title: nil)
    }
  }
  
  func setupConstraints() {
    
  }
}

// MARK: - Private Methods

private extension RootTabViewController {
  func setupTabBarItem(_ item: UITabBarItem, using image: UIImage?, title: String?) {
    item.image = image
    item.title = title
    item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
  }
}
