//
// Created by justin on 13/12/2019.
// Copyright (c) 2019 djachenko. All rights reserved.
//

import XCTest
@testable import AutofillerExamples

class ImplicitFieldsAutofillerTests: GenericAutofillerTests {
    override func createVC() -> AutofillableViewController {
        return ImplicitFieldsViewController(autofillEnabled: true)
    }

    override class var defaultTestSuite: XCTestSuite {
        return XCTestSuite(forTestCaseClass: self)
    }
}
