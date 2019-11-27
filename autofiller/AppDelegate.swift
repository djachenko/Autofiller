//
//  AppDelegate.swift
//  autofiller
//
//  Created by justin on 25/11/2019.
//  Copyright © 2019 djachenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootController = UITabBarController()

        let viewControllers = [
            ImplicitFieldsViewController(),
            NestedFieldsViewController()
        ]

        let navigationControllers = viewControllers.map { vc in UINavigationController(rootViewController: vc)}

        rootController.viewControllers = navigationControllers
        rootController.selectedIndex = 0

        window?.rootViewController = rootController

        window?.makeKeyAndVisible()

        return true
    }
}

