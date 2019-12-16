//
// Created by Igor Djachenko on 16/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//


import Foundation
@testable import AutofillerExamples

class ImplicitFieldsSnapshotTests: GenericSnapshotTests {
    override func createVC(autofillEnabled: Bool) -> AutofillableViewController {
        return ImplicitFieldsViewController(autofillEnabled: autofillEnabled)
    }
}
