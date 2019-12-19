//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit
import Autofiller

class SignInAutofillViewController: AutofillableViewController {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func updateAutofill() throws {
        guard loginField != nil && passwordField != nil else {
            return
        }

        if autofillEnabled {
            try Autofiller.connectFields(login: loginField, password: passwordField)
        }
    }

    @IBAction private func logIn() {
        next()
    }
}
