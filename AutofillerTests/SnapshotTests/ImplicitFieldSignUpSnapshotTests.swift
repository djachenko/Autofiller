//
// Created by Igor Djachenko on 16/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


@testable import AutofillerExamples

class ImplicitFieldSignUpSnapshotTests: GenericSnapshotTests {
    override func createVC(autofillEnabled: Bool) -> AutofillableViewController {
        return ImplicitFieldsSignUpViewController(autofillEnabled: autofillEnabled)
    }
}
