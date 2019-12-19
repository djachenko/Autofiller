//
// Created by Igor Djachenko on 15/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import UIKit


class TableFormSignInViewController: SignInAutofillViewController {
    @IBOutlet private weak var tableView: UITableView!

    override class var name: String {
        return "Table-based form"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(cellType: TableFormFieldCell.self)
        tableView.register(cellType: TableFormButtonCell.self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        do {
            try updateAutofill()
        }
        catch {
            showMessage(error: error)
        }
    }
}

extension TableFormSignInViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

        let rowCount = self.tableView(tableView, numberOfRowsInSection: indexPath.section)

        if indexPath.row >= rowCount {
            assertionFailure("Table row range exceeded")
        }
        else if indexPath.row == rowCount - 1 {
            let buttonCell = tableView.dequeueReusableCell(for: indexPath) as TableFormButtonCell

            buttonCell.delegate = self

            cell = buttonCell
        }
        else {
            let fieldCell = tableView.dequeueReusableCell(for: indexPath) as TableFormFieldCell

            switch indexPath.row {
                case 0:
                    loginField = fieldCell.textField
                    fieldCell.set(placeholder: "login")
                case 1:
                    passwordField = fieldCell.textField
                    fieldCell.set(placeholder: "password")
                default:
                    break
            }

            cell = fieldCell
        }

        return cell
    }
}

extension TableFormSignInViewController: TableFormButtonCellDelegate {
    internal func tappedButtonCell() {
        next()
    }
}