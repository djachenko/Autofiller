//
// Created by justin on 2019-11-26.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

class AutofillableViewController: BaseViewController {
    @IBOutlet private(set) weak var loginField: UITextField!
    @IBOutlet private(set) weak var passwordField: UITextField!

    class var name: String {
        fatalError()
    }

    let autofillEnabled: Bool

    required init(autofillEnabled: Bool) {
        self.autofillEnabled = autofillEnabled

        super.init()

        title = type(of: self).name + " example"
        updateTabBarItem()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateAutofill()
    }

    private func updateTabBarItem() {
        var item: UITabBarItem

        if autofillEnabled {
            item = UITabBarItem(title: "Autofill enabled", image: UIImage(named: "yes_icon"), selectedImage: nil)
        } else {
            item = UITabBarItem(title: "Autofill disabled", image: UIImage(named: "no_icon"), selectedImage: nil)
        }

        tabBarItem = item
    }

    private func updateAutofill() {
        Autofiller.connectFields(login: loginField, password: passwordField)
    }

    @IBAction private func logIn() {
        let successVC = SuccessViewController()

        navigationController?.pushViewController(successVC, animated: true)
    }
}
