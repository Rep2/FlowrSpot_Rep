//
//  AppDelegate.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = initializeWindow()
    setupApperance()

    return true
  }

  private func initializeWindow() -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = RootTabViewController()
    window.makeKeyAndVisible()
    return window
  }

  func setupApperance() {
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .highlighted)
  }
}
