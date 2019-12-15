//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit
import Reusable

protocol TableFormButtonCellDelegate: class {
    func tappedButtonCell()
}

class TableFormButtonCell: UITableViewCell, NibLoadable {
    weak var delegate: TableFormButtonCellDelegate?

    func configure(with delegate: TableFormButtonCellDelegate) {
        self.delegate = delegate
    }

    @IBAction private func tappedButton() {
        delegate?.tappedButtonCell()
    }
}
