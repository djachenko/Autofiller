//
// Created by Igor Djachenko on 19/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import XCTest
import Autofiller
import UIKit

class AutofillerErrorTests: XCTestCase {
    var loginField: UITextField!
    var passwordField: UITextField!
    var confirmPasswordField: UITextField!
    var ancestor: UIView!

    override func setUp() {
        super.setUp()

        loginField = UITextField()
        passwordField = UITextField()
        confirmPasswordField = UITextField()
        ancestor = UIView()
    }

    override func tearDown() {
        loginField = nil
        passwordField = nil
        confirmPasswordField = nil
        ancestor = nil

        super.tearDown()
    }

    private func handle(error: Error) {
        guard let autofillerError = error as? AutofillerError else {
            XCTFail()

            return
        }

        XCTAssertEqual(autofillerError, .noCommonAncestor)
    }

    func testSignInWithoutAncestor() {
        XCTAssertThrowsError(try Autofiller.connectFields(login: loginField, password: passwordField)) {
            handle(error: $0)
        }
    }

    func testSignUpTwoFieldsWithoutAncestor() {
        XCTAssertThrowsError(try Autofiller.connectFields(login: loginField, newPassword: passwordField)) {
            handle(error: $0)
        }
    }

    func testSignUpThreeFieldsWithoutAncestor() {
        XCTAssertThrowsError(try Autofiller.connectFields(
                login: loginField,
                newPassword: passwordField,
                confirmPassword: confirmPasswordField)) {
            handle(error: $0)
        }
    }

    private func addFieldToAncestor() {
        [
            loginField,
            passwordField,
            confirmPasswordField
        ]
                .compactMap({ $0 })
                .forEach { field in

                    let intermediateView = UIView()

                    intermediateView.addSubview(field)

                    ancestor.addSubview(intermediateView)
                }
    }

    func testSignInWithAncestor() {
        addFieldToAncestor()

        XCTAssertNoThrow(try Autofiller.connectFields(login: loginField, password: passwordField))
    }

    func testSignUpTwoFieldsWithAncestor() {
        addFieldToAncestor()

        XCTAssertNoThrow(try Autofiller.connectFields(login: loginField, newPassword: passwordField))
    }

    func testSignUpThreeFieldsWithAncestor() {
        addFieldToAncestor()

        XCTAssertNoThrow(try Autofiller.connectFields(
                login: loginField,
                newPassword: passwordField,
                confirmPassword: confirmPasswordField))
    }
}
