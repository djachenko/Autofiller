//
// Created by justin on 2019-11-28.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
}
