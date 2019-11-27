//
// Created by justin on 2019-11-27.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

class NestedFieldsViewController: LoginableViewController {
    @IBOutlet private weak var loginTextView: UITextField!
    @IBOutlet private weak var passwordTextView: UITextField!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        title = "Nested"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Autofiller.connect(fields: [
            loginTextView,
            passwordTextView
        ])
    }
}
