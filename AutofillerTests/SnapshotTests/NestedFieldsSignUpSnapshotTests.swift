//
// Created by Igor Djachenko on 16/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


@testable import AutofillerExamples

class NestedFieldsSignUpSnapshotTests: GenericSnapshotTests {
    override func createVC(autofillEnabled: Bool) -> AutofillableViewController {
        return NestedFieldsSignUpViewController(autofillEnabled: autofillEnabled)
    }
}
