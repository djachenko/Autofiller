//
// Created by Igor Djachenko on 2019-11-28.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit
import TableKit

class ExampleListViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var tableDirector: TableDirector?

    let exampleTypes: [AutofillableViewController.Type]

    init(examples: [AutofillableViewController.Type]) {
        exampleTypes = examples

        super.init()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let director = TableDirector(tableView: tableView)

        let rows = exampleTypes
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


        director += rows

        tableDirector = director

        title = "Examples"
    }
}
