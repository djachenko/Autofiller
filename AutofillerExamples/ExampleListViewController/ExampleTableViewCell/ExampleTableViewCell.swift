//
// Created by Igor Djachenko on 2019-11-29.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit
import TableKit

class ExampleTableViewCell: UITableViewCell, ConfigurableCell {
    @IBOutlet private weak var titleLabel: UILabel!

    func configure(with exampleType: AutofillableViewController.Type) {
        let title = exampleType.name

        titleLabel.text = title
    }
}
