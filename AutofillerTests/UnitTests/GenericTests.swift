//
// Created by Igor Djachenko on 16/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import XCTest

class GenericTests: XCTestCase {
    override class var defaultTestSuite: XCTestSuite {
        if self == GenericTests.self {
            return XCTestSuite(name: "Generic tests excluded")
        }

        return super.defaultTestSuite
    }
}
