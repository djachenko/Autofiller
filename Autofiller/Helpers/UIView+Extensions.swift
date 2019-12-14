//
// Created by Igor Djachenko on 2019-11-27.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static func commonAncestor(for views: [UIView]) -> UIView? {
        guard var testView = views.first else {
            return nil
        }

        for view in views {
            while !view.isDescendant(of: testView) {
                guard let superview = testView.superview else {
                    //at least two views don't have common s
                    return nil
                }

                testView = superview
            }
        }

        return testView
    }

    func allExternalConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()

        var _superview = superview

        while let superview = _superview {
            for constraint in superview.constraints {

                if let first = constraint.firstItem as? UIView, first == self {
                    constraints.append(constraint)
                }
                else if let second = constraint.secondItem as? UIView, second == self {
                    constraints.append(constraint)
                }
            }

            _superview = superview.superview
        }

        return constraints
    }
}