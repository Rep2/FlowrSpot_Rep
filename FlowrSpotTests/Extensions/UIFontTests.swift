//
//  UIFontExtensionsTests.swift
//  FlowrSpotTests
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class UIFontTests: XCTestCase {
  func testFontName() {
    XCTAssertEqual(FontStyle.regular.name, FontStyle.fontFamilyName)
    
    XCTAssertEqual(FontStyle.light.name, FontStyle.fontFamilyName+"-Light")
    XCTAssertEqual(FontStyle.semibold.name, FontStyle.fontFamilyName+"-Medium")
    XCTAssertEqual(FontStyle.bold.name, FontStyle.fontFamilyName+"-Bold")
    XCTAssertEqual(FontStyle.italicLight.name, FontStyle.fontFamilyName+"-LightItalic")
    XCTAssertEqual(FontStyle.italic.name, FontStyle.fontFamilyName+"-Italic")
    XCTAssertEqual(FontStyle.italicSemibold.name, FontStyle.fontFamilyName+"-MediumItalic")
    XCTAssertEqual(FontStyle.italicBold.name, FontStyle.fontFamilyName+"-BoldItalic")
  }
}

