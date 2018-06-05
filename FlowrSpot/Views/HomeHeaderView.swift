//
//  HomeHeaderView.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit
import SnapKit

class HomeHeaderView: UIView {
  private let backgroundImageView = UIImageView.autolayoutView()
  private let titleLabel = UILabel.autolayoutView()
  private let subtitleLabel = UILabel.autolayoutView()
  private let searchBar = SearchView.autolayoutView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    return searchBar.frame.contains(point)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - ViewLifecycle
extension HomeHeaderView: ViewLifecycle {
  func setupViews() {
    clipsToBounds = true
    
    addSubview(backgroundImageView)
    backgroundImageView.image = UIImage(named: "plHero")
    backgroundImageView.contentMode = .scaleAspectFill
    
    addSubview(titleLabel)
    titleLabel.font = .custom(type: .regular, size: 24)
    titleLabel.textColor = .white
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 0
    titleLabel.text = "home_title".localized()
    
    addSubview(subtitleLabel)
    subtitleLabel.font = .custom(type: .light, size: 12)
    subtitleLabel.textAlignment = .center
    subtitleLabel.numberOfLines = 0
    subtitleLabel.alpha = 0.7
    subtitleLabel.textColor = .white
    subtitleLabel.text = "home_subtitle".localized()
    
    addSubview(searchBar)
    searchBar.placeholder = "home_search_placeholder".localized()
  }
  
  func setupConstraints() {
    backgroundImageView.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints { (make) in
      make.top.equalTo(60)
      make.left.equalTo(20)
      make.right.equalTo(-20)
    }
    
    subtitleLabel.snp.makeConstraints { (make) in
      make.left.equalTo(20)
      make.right.equalTo(-20)
      make.centerX.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom).offset(20)
    }
    
    searchBar.snp.makeConstraints { (make) in
      make.top.equalTo(subtitleLabel).inset(40)
      make.left.equalTo(30)
      make.right.equalTo(-30)
      make.height.equalTo(45)
      make.centerX.equalToSuperview()
    }
  }
}
