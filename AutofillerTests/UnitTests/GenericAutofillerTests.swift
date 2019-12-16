//
//  AutofillerTests.swift
//  AutofillerTests
//
//  Created by Igor Djachenko on 12/12/2019.
//  Copyright © 2019 djachenko. All rights reserved.
//

import XCTest
@testable import AutofillerExamples

class GenericAutofillerTests: XCTestCase {

    var viewController: AutofillableViewController!

    override func setUp() {
        super.setUp()

        viewController = createVC()

        let _ = viewController.view
    }

    override func tearDown() {
        viewController = nil

        super.tearDown()
    }

    func createVC() -> AutofillableViewController {
        fatalError("createVC() is not implemented")
    }

    func testLoginFieldInitialized() {
        XCTAssertNotNil(viewController.loginField)
    }

    func testPasswordFieldInitialized() {
        XCTAssertNotNil(viewController.passwordField)
    }

    func testFieldsHaveSameSuperview() {
        XCTAssertEqual(
                viewController.loginField.superview,
                viewController.passwordField.superview
        )
    }

    override class var defaultTestSuite: XCTestSuite {
        if self == GenericAutofillerTests.self {
            return XCTestSuite(name: "Generic tests excluded")
        }

        return super.defaultTestSuite
    }
}
