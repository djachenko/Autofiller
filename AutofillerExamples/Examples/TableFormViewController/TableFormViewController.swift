//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit


class TableFormViewController: AutofillableViewController {
    @IBOutlet private weak var tableView: UITableView!

    var cells = [UITableViewCell]()

    override class var name: String {
        return "Table-based form"
    }

    override func viewDidLoad() {
        let loginCell = TableFormFieldCell.loadFromNib()
        let passwordCell = TableFormFieldCell.loadFromNib()
        let buttonCell = TableFormButtonCell.loadFromNib()


        loginField = loginCell.textField
        passwordField = passwordCell.textField

        super.viewDidLoad()

        loginCell.set(placeholder: "login")
        passwordCell.set(placeholder: "password")
        buttonCell.delegate = self

        cells = [
            loginCell,
            passwordCell,
            buttonCell
        ]
    }
}

extension TableFormViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}

extension TableFormViewController: TableFormButtonCellDelegate {
    internal func tappedButtonCell() {
        logIn()
    }
}
