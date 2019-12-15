//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit
import Reusable

class TableFormFieldCell: UITableViewCell, NibLoadable {
    @IBOutlet private(set) weak var textField: UITextField!

    func set(placeholder: String) {
        textField.placeholder = placeholder
    }
}
