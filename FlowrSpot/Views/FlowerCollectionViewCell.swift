//
//  PhotoCollectionViewCell.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit
import Kingfisher

class FlowerCollectionViewCell: UICollectionViewCell {
  private let imageView = UIImageView.autolayoutView()
  private let favoriteButton = UIButton.autolayoutView()
  private let titleLabel = UILabel.autolayoutView()
  private let subtitleLabel = UILabel.autolayoutView()
  private let sightingsLabel = UILabel.autolayoutView()
  private let sightingsLabelWrapperView = UIView.autolayoutView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public methods
extension FlowerCollectionViewCell {
  func setFlower(_ flower: Flower) {
    titleLabel.text = flower.name
    subtitleLabel.text = flower.latinName
    sightingsLabel.text = "sightings_count".localized(args: flower.sightings)
    imageView.kf.setImage(with: URL(string: flower.url))
  }
}

// MARK: - ViewLifecycle
extension FlowerCollectionViewCell: ViewLifecycle {
  func setupViews() {
    layer.masksToBounds = true
    layer.cornerRadius = 3
    
    addSubview(imageView)
    imageView.kf.indicatorType = .activity
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.opacity = 0.8
    imageView.layer.addSublayer(gradientLayer)
    
    addSubview(titleLabel)
    titleLabel.font = .custom(type: .regular, size: 20)
    titleLabel.textColor = .white
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    
    addSubview(subtitleLabel)
    subtitleLabel.font = .custom(type: .italic, size: 10)
    subtitleLabel.textColor = .white
    subtitleLabel.textAlignment = .center
    subtitleLabel.alpha = 0.7
    
    addSubview(favoriteButton)
    favoriteButton.backgroundColor = .white
    favoriteButton.layer.cornerRadius = 12
    favoriteButton.setImage(#imageLiteral(resourceName: "favoritesIcons"), for: .normal)
    
    addSubview(sightingsLabelWrapperView)
    sightingsLabelWrapperView.backgroundColor = .black
    sightingsLabelWrapperView.alpha = 0.5
    sightingsLabelWrapperView.layer.cornerRadius = 12
    
    addSubview(sightingsLabel)
    sightingsLabel.font = .custom(type: .regular, size: 10)
    sightingsLabel.textColor = .white
    sightingsLabel.textAlignment = .center
  }
  
  func setupConstraints() {
    imageView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    favoriteButton.snp.makeConstraints { (make) in
      make.top.equalTo(12)
      make.trailing.equalTo(-12)
      make.size.equalTo(24)
    }
    
    sightingsLabel.snp.makeConstraints { (make) in
      make.bottom.equalTo(-30)
      make.height.equalTo(24)
      make.centerX.equalToSuperview()
    }
    
    sightingsLabelWrapperView.snp.makeConstraints { (make) in
      make.center.equalTo(sightingsLabel.snp.center)
      make.height.equalTo(24)
      make.width.equalTo(sightingsLabel.snp.width).offset(25)
    }
    
    subtitleLabel.snp.makeConstraints { (make) in
      make.leading.equalTo(20)
      make.trailing.equalTo(-20)
      make.bottom.equalTo(sightingsLabelWrapperView.snp.top).offset(-20)
      make.centerX.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints { (make) in
      make.leading.equalTo(12)
      make.trailing.equalTo(-12)
      make.bottom.equalTo(subtitleLabel).inset(15)
      make.centerX.equalToSuperview()
    }
  }
}
