//
// Created by Igor Djachenko on 2019-11-30.
// Copyright (c) 2019 justin. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func same() -> Bool{
        guard count > 1 else {
            return true
        }

        guard let firstElement = first else {
            return true
        }

        for item in self {
            if item != firstElement {
                return false
            }
        }

        return true
    }
}