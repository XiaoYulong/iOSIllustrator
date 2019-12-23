//
//  AppDelegate.swift
//  iOSIllustrator
//
//  Created by Yulong Xiao on 2019/12/23.
//  Copyright © 2019 Yulong Xiao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

