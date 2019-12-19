//
// Created by Igor Djachenko on 2019-11-27.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 11, *)
public class Autofiller {
    public static func connectFields(login: UITextField, password: UITextField) throws {
        login.textContentType = .username
        password.textContentType = .password

        try connect(fields: [
            login,
            password
        ])
    }

    public static func connectFields(login: UITextField, newPassword: UITextField, confirmPassword: UITextField? = nil) throws {
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

        try connect(fields: [
            login,
            newPassword,
            confirmPassword
        ].compactMap {
            $0
        })
    }

    private static func connect(fields: [UITextField]) throws {
        guard let commonView = UIView.commonAncestor(for: fields) else {
            throw AutofillerError.noCommonAncestor
        }

        let fieldsAreAlreadySiblings = fields
                .map({ $0.superview })
                .compactMap({ $0 })
                .same()

        guard !fieldsAreAlreadySiblings else {
            return
        }

        fields.forEach { field in
            let fieldConstraints = field.allExternalConstraints()

            commonView.addSubview(field)

            let newConstraints = fieldConstraints.map { old in
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

            fieldConstraints.forEach { constraint in
                constraint.isActive = false
            }
        }
    }
}
