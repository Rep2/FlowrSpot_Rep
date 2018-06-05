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
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView.autolayoutView()

    imageView.kf.indicatorType = .activity
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.opacity = 0.8
    imageView.layer.addSublayer(gradientLayer)

    return imageView
  }()

  private lazy var favoriteButton: UIButton = {
    let button = UIButton.autolayoutView()

    button.backgroundColor = .white
    button.layer.cornerRadius = 12
    button.setImage(#imageLiteral(resourceName: "favoritesIcons"), for: .normal)

    return button
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 20)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 2

    return label
  }()

  private lazy var subtitleLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 10)
    label.textColor = .white
    label.textAlignment = .center
    label.alpha = 0.7

    return label
  }()

  private lazy var sightingsLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 10)
    label.textColor = .white
    label.textAlignment = .center

    return label
  }()

  private lazy var sightingsLabelWrapperView: UIView = {
    let view = UIView.autolayoutView()

    view.backgroundColor = .black
    view.alpha = 0.5
    view.layer.cornerRadius = 12

    return view
  }()
}

// MARK: - Public methods
extension FlowerCollectionViewCell {
  func setFlower(_ flower: Flower) {
    setup()

    titleLabel.text = flower.name
    subtitleLabel.text = flower.latinName
    sightingsLabel.text = "sightings_count".localized(args: flower.sightings)
    imageView.kf.setImage(with: URL(string: flower.url))
  }
}

// MARK: - ViewLifecycle
extension FlowerCollectionViewCell: ViewLifecycle {
  func setupViews() {
    guard layer.cornerRadius != 3 else { return }

    layer.masksToBounds = true
    layer.cornerRadius = 3

    addSubview(imageView)
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    addSubview(favoriteButton)
    addSubview(sightingsLabel)
    addSubview(sightingsLabelWrapperView)
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
