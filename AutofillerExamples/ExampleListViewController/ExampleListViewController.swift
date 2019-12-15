//
// Created by Igor Djachenko on 2019-11-28.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation
import UIKit
import TableKit

class ExampleListViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var tableDirector: TableDirector?

    let signInExampleTypes: [AutofillableViewController.Type]
    let signUpExampleTypes: [AutofillableViewController.Type]


    init(signInExamples: [AutofillableViewController.Type], signUpExamples: [AutofillableViewController.Type]) {
        signInExampleTypes = signInExamples
        signUpExampleTypes = signUpExamples

        super.init()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let director = TableDirector(tableView: tableView)

        func rows(from types: [AutofillableViewController.Type]) -> [Row] {
            return types
                    .map({ type in TableRow<ExampleTableViewCell>(item: type) })
                    .map({ row in

                        row.on(.click) { [unowned self] options in
                            let tabController = UITabBarController()

                            let viewControllers = [false, true].map { enabled in
                                options.item.init(autofillEnabled: enabled)
                            }

                            tabController.viewControllers = viewControllers
                            tabController.selectedIndex = 0
                            tabController.title = options.item.name + " example"

                            self.navigationController?.pushViewController(tabController, animated: true)
                        }
                    })
        }

        let sections = [
            TableSection(headerTitle: "Sign in examples", footerTitle: nil, rows: rows(from: signInExampleTypes)),
            TableSection(headerTitle: "Sign up examples", footerTitle: nil, rows: rows(from: signUpExampleTypes))
        ]


        director += sections

        tableDirector = director

        title = "Examples"
    }
}
