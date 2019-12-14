//
// Created by Igor Djachenko on 2019-11-27.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 11, *)
public class Autofiller {
    public static func connectFields(login: UITextField, password: UITextField) {
        login.textContentType = .username
        password.textContentType = .password

        connect(fields: [
            login,
            password
        ])
    }

    public static func connectFields(login: UITextField, newPassword: UITextField, confirmPassword: UITextField? = nil) {
        login.textContentType = .username

        var newPasswordValue: UITextContentType

        if #available(iOS 12, *) {
            newPasswordValue = .newPassword
        }
        else {
            newPasswordValue = .password
        }

        newPassword.textContentType = newPasswordValue
        confirmPassword?.textContentType = newPasswordValue

        connect(fields: [
            login,
            newPassword,
            confirmPassword
        ].compactMap {
            $0
        })
    }

    private static func connect(fields: [UITextField]) {
        guard let commonView = UIView.commonAncestor(for: fields) else {
            return
        }

        let fieldsAreAlreadySiblings = fields
                .map({ $0.superview })
                .compactMap({ $0 })
                .same()

        guard !fieldsAreAlreadySiblings else {
            return
        }

        fields.forEach { view in
            let viewConstraints = view.allExternalConstraints()

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

            commonConstraints.forEach { constraint in
                constraint.isActive = false
            }
        }
    }
}