//
// Created by justin on 2019-11-26.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

class LoginableViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    @IBAction private func logIn() {
        let successVC = SuccessViewController()

        navigationController?.pushViewController(successVC, animated: true)
    }
}
