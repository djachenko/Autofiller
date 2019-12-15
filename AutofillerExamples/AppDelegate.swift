//
//  AppDelegate.swift
//  autofiller
//
//  Created by Igor Djachenko on 25/11/2019.
//  Copyright © 2019 djachenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let signInVCTypes = [
            ImplicitFieldsSignInViewController.self,
            NestedFieldsSignInViewController.self,
            TableFormSignInViewController.self
        ]

        let signUpVCTypes = [
            ImplicitFieldsSignUpViewController.self,
            NestedFieldsSignUpViewController.self,
            TableFormSignUpViewController.self
        ]

        let exampleListVC = ExampleListViewController(signInExamples: signInVCTypes, signUpExamples: signUpVCTypes)

        let rootController = UINavigationController(rootViewController: exampleListVC)

        window?.rootViewController = rootController

        window?.makeKeyAndVisible()

        return true
    }
}

