//
//  AppDelegate.swift
//  Anoda_Test
//
//  Created by Serg Liamthev on 9/24/18.
//  Copyright © 2018 SergLam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootViewController = MainVC()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        window?.rootViewController = rootViewController
        return true
    }

}

