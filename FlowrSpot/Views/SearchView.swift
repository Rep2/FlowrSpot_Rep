//
//  SearchView.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

class SearchView: UIView {
  private let placeholderLabel = UILabel.autolayoutView()
  private let iconImageView = UIImageView.autolayoutView()
  private let textField = UITextField.autolayoutView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    becomeFirstResponder()
  }
}

// MARK: - Public methods
extension SearchView {
  @discardableResult
  override func becomeFirstResponder() -> Bool {
    textField.becomeFirstResponder()
    return super.becomeFirstResponder()
  }
  
  var placeholder: String? {
    get { return placeholderLabel.text }
    set { placeholderLabel.text = newValue }
  }
  
  var text: String? {
    get { return textField.text }
    set { textField.text = newValue }
  }
  
  var font: UIFont? {
    get { return textField.font }
    set {
      textField.font = newValue
      placeholderLabel.font = newValue
    }
  }
  
  var placeholderColor: UIColor {
    get { return placeholderLabel.textColor }
    set { placeholderLabel.textColor = placeholderColor }
  }
  
  var textColor: UIColor? {
    get { return textField.textColor }
    set { textField.textColor = textColor }
  }
}

// MARK: - UITextField Delegate
extension SearchView: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let query = replacingString(for: textField.text ?? "", replacementString: string, range: range)
    togglePlaceholder(text: query)
    return true
  }
}

// MARK: - ViewLifecycle
extension SearchView: ViewLifecycle {
  func setupViews() {
    layer.cornerRadius = 2
    
    let defaultFont = UIFont.custom(type: .light, size: 14)
    
    addSubview(placeholderLabel)
    placeholderLabel.font = defaultFont
    placeholderLabel.textColor = .flowrGray
    
    addSubview(textField)
    textField.font = defaultFont
    textField.textColor = .black
    textField.delegate = self
    
    addSubview(iconImageView)
    iconImageView.image = UIImage(named: "plIconSearch")
  }
  
  func setupConstraints() {
    placeholderLabel.snp.makeConstraints { (make) in
      make.left.equalTo(20)
      make.right.equalTo(iconImageView.snp.left).inset(20)
      make.centerY.equalToSuperview()
    }
    
    iconImageView.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.right.equalTo(-20)
      make.size.equalTo(14)
    }
    
    textField.snp.makeConstraints { (make) in
      make.left.equalTo(20)
      make.right.equalTo(iconImageView.snp.left).offset(-10)
      make.centerY.equalToSuperview()
    }
  }
}

// MARK: - Private methods
private extension SearchView {
  func replacingString(for currentText: String, replacementString string: String, range: NSRange) -> String {
    return NSString(string: currentText).replacingCharacters(in: range, with: string) as String
  }
  
  func togglePlaceholder(text: String) {
    UIView.animate(withDuration: 0.3) {
      self.placeholderLabel.isHidden = !text.isEmpty
    }
  }
}
