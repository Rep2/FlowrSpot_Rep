//
//  EmptyView.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 26/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

class EmptyView: UIView {
  private let label = UILabel.autolayoutView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public Methods
extension EmptyView {
  var textColor: UIColor {
    get { return label.textColor }
    set { label.textColor = newValue }
  }
  
  var text: String? {
    get { return label.text }
    set { label.text = newValue }
  }
  
  var font: UIFont {
    get { return label.font }
    set { label.font = newValue }
  }
}

// MARK: - ViewLifecycle
extension EmptyView: ViewLifecycle {
  func setupViews() {
    addSubview(label)
    label.textAlignment = .center
    label.textColor = .flowrGray
    label.font = UIFont.custom(type: .italicLight, size: 14)
  }
  
  func setupConstraints() {
    label.snp.makeConstraints { (make) in
      make.leading.lessThanOrEqualToSuperview().offset(20)
      make.trailing.lessThanOrEqualToSuperview().offset(-20)
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(-20)
    }
  }
}
