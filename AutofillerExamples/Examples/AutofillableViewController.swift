//
// Created by Igor Djachenko on 2019-11-26.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation
import UIKit
import Autofiller

class AutofillableViewController: BaseViewController {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

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

    override func viewDidLoad() {
        super.viewDidLoad()

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

    func updateAutofill() {
        guard loginField != nil && passwordField != nil else {
            return
        }

        if autofillEnabled {
            Autofiller.connectFields(login: loginField, password: passwordField)
        }
    }

    @IBAction func logIn() {
        let successVC = SuccessViewController()

        navigationController?.pushViewController(successVC, animated: true)
    }
}
