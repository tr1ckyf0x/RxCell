//
//  AppDelegate.swift
//  RxCell
//
//  Created by Vladislav Lisyanskiy on 16.06.2018.

import UIKit
import RxCell

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    RxCell.activate()
    return true
  }
}

