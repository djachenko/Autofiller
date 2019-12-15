//
// Created by Igor Djachenko on 13/12/2019.
// Copyright (c) 2019 justin. All rights reserved.
//

import XCTest
@testable import AutofillerExamples

class NestedFieldsSignInViewControllerTests: GenericSignInViewControllerTests {
    override func createVC() -> SignInAutofillViewController {
        return NestedFieldsSignInViewController(autofillEnabled: true)
    }
}
