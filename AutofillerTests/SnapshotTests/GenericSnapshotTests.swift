//
// Created by Igor Djachenko on 16/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
import FBSnapshotTestCase
@testable import AutofillerExamples

class GenericSnapshotTests: FBSnapshotTestCase {
    var viewController: AutofillableViewController!
    private static let recordingReferences = false

    override func setUp() {
        super.setUp()

        viewController = createVC(autofillEnabled: !GenericSnapshotTests.recordingReferences)
        recordMode = GenericSnapshotTests.recordingReferences
    }

    override func tearDown() {
        viewController = nil
    }

    func createVC(autofillEnabled: Bool) -> AutofillableViewController {
        fatalError("createVC() is not implemented")
    }

    func testAutofillerPreservedUI() {
        FBSnapshotVerifyViewController(viewController)
    }

    override class var defaultTestSuite: XCTestSuite {
        if self == GenericSnapshotTests.self {
            return XCTestSuite(name: "Generic tests excluded")
        }

        return super.defaultTestSuite
    }
}
