//
// Created by Igor Djachenko on 2019-11-26.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation
import UIKit
import Autofiller

class AutofillableViewController: BaseViewController {
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

        do {
            try updateAutofill()
        }
        catch let error {
            showMessage(error: error)
        }
    }

    private func updateTabBarItem() {
        var item: UITabBarItem

        if autofillEnabled {
            item = UITabBarItem(title: "Autofill enabled", image: UIImage(named: "yes_icon"), selectedImage: nil)
        }
        else {
            item = UITabBarItem(title: "Autofill disabled", image: UIImage(named: "no_icon"), selectedImage: nil)
        }

        tabBarItem = item
    }

    func updateAutofill() throws {
        fatalError("updateAutofill() not implemented")
    }

    func next() {
        let successVC = SuccessViewController()

        navigationController?.pushViewController(successVC, animated: true)
    }

    func showMessage(error: Error) {
        var title = "Error"
        var description = error.localizedDescription

        if let autofillerError = error as? AutofillerError {
            title = "AutofillerError"

            switch autofillerError {
                case .noCommonAncestor:
                    description = "Fields didn't have common ancestor"
            }
        }

        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }

        alert.addAction(okAction)

        present(alert, animated: true)
    }
}
