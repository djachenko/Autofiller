//
//  AutofillerTests.swift
//  AutofillerTests
//
//  Created by justin on 12/12/2019.
//  Copyright © 2019 djachenko. All rights reserved.
//

import XCTest
@testable import AutofillerExamples

class AutofillerTests: XCTestCase {

    var viewController: AutofillableViewController!

    override func setUp() {
        viewController = NestedFieldsViewController(autofillEnabled: true)

        let _ = viewController.view
    }

    override func tearDown() {
        viewController = nil
    }

    func testLoginFieldInitialized() {
        XCTAssertNotNil(viewController.loginField)
    }

    func testPasswordFieldInitialized() {
        XCTAssertNotNil(viewController.passwordField)
    }

    func testSameSuperview() {
        XCTAssertEqual(
                viewController.loginField.superview,
                viewController.passwordField.superview
        )
    }
}
