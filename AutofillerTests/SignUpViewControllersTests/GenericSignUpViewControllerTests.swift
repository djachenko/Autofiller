//
//  AutofillerTests.swift
//  AutofillerTests
//
//  Created by Igor Djachenko on 12/12/2019.
//  Copyright © 2019 djachenko. All rights reserved.
//

import XCTest
@testable import AutofillerExamples

class GenericSignUpViewControllerTests: GenericTests {

    var viewController: SignUpAutofillViewController!

    override func setUp() {
        viewController = createVC()

        let _ = viewController.view
    }

    override func tearDown() {
        viewController = nil
    }

    func createVC() -> SignUpAutofillViewController {
        fatalError("createVC() is not implemented")
    }

    func testLoginFieldInitialized() {
        XCTAssertNotNil(viewController.loginField)
    }

    func testNewPasswordFieldInitialized() {
        XCTAssertNotNil(viewController.newPasswordField)
    }

    func testConfirmPasswordFieldInitialized() {
        XCTAssertNotNil(viewController.confirmPasswordField)
    }

    func testSameSuperview() {
        XCTAssertEqual(
                viewController.loginField.superview,
                viewController.newPasswordField.superview
        )

        XCTAssertEqual(
                viewController.newPasswordField.superview,
                viewController.confirmPasswordField?.superview
        )

        XCTAssertEqual(
                viewController.loginField.superview,
                viewController.confirmPasswordField?.superview
        )
    }

    override class var defaultTestSuite: XCTestSuite {
        if self == GenericSignUpViewControllerTests.self {
            return XCTestSuite(name: "Generic tests excluded")
        }

        return super.defaultTestSuite
    }
}
