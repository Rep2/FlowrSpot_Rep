//
//  Font+Extra.swift
//  CoinMarket
//
//  Created by Toni Kocjan on 04/11/2017.
//  Copyright © 2017 Toni Kocjan. All rights reserved.
//

import UIKit

public enum FontStyle: String {
  static let fontFamilyName = "Ubuntu"
  
  case light = "Light"
  case regular = "Regular"
  case semibold = "Medium"
  case bold = "Bold"
  case italicLight = "LightItalic"
  case italic = "Italic"
  case italicSemibold = "MediumItalic"
  case italicBold = "BoldItalic"
  
  var name: String {
    switch self {
    case .regular:
      return FontStyle.fontFamilyName
    case .light, .semibold, .bold, .italicLight, .italic, .italicSemibold, .italicBold:
      return "\(FontStyle.fontFamilyName)-\(rawValue)"
    }
  }
}

extension UIFont {
  static func custom(type: FontStyle, size: CGFloat) -> UIFont {
    return UIFont(name: type.name, size: size) ?? .systemFont(ofSize: size)
  }
}
