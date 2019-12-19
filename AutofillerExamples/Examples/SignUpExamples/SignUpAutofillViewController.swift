//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit
import Autofiller

class SignUpAutofillViewController: AutofillableViewController {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField?

    override func updateAutofill() throws {
        guard loginField != nil && newPasswordField != nil else {
            return
        }

        if autofillEnabled {
            try Autofiller.connectFields(
                    login: loginField,
                    newPassword: newPasswordField,
                    confirmPassword: confirmPasswordField
            )
        }
    }

    @IBAction private func signUp() {
        next()
    }
}
