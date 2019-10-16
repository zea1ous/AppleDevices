//
//  AppDelegate.swift
//  Teset_new
//
//  Created by ragnaros on 25.06.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DevicesViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

