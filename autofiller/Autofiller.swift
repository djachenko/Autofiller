//
// Created by justin on 2019-11-27.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

class Autofiller {
    static func connect(fields: [UITextField]) {
        guard let commonView = UIView.commonAncestor(for: fields) else {
            return
        }

        fields.forEach { view in
            let viewConstraints = view.allExternalConstraints()

            let commonConstraints = viewConstraints.filter { constraint in
                guard let firstItem = constraint.firstItem as? UIView,
                      let secondItem = constraint.secondItem as? UIView else {
                    return false
                }

                return firstItem == view || secondItem == view
            }

            commonView.addSubview(view)

            let newConstraints = commonConstraints.map { old in
                NSLayoutConstraint(item: old.firstItem as Any,
                        attribute: old.firstAttribute,
                        relatedBy: old.relation,
                        toItem: old.secondItem,
                        attribute: old.secondAttribute,
                        multiplier: old.multiplier,
                        constant: old.constant)
            }

            newConstraints.forEach { constraint in
                constraint.isActive = true
            }
        }
    }
}
