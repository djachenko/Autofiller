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

        let exampleVCTypes = [
            ImplicitFieldsViewController.self,
            NestedFieldsViewController.self
        ]

        let exampleListVC = ExampleListViewController(examples: exampleVCTypes)

        let rootController = UINavigationController(rootViewController: exampleListVC)

        window?.rootViewController = rootController

        window?.makeKeyAndVisible()

        return true
    }
}

