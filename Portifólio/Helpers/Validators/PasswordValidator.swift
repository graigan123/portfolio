//
//  PasswordValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class PasswordValidator: SuperValidator { }

extension PasswordValidator: ValidatorConvertible {
    struct Constants {
        static let passwordValidationError = String.localized(by: "passwordValidationError")
        static let passwordMustHave6Digits = String.localized(by: "passwordMustHave6Digits")
        static let passwordMustHaveLessThan12Digits = String.localized(by: "passwordMustHaveLessThan12Digits")
    }
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        guard value.count >= 6 else { return Result.error(ValidationError.specific(message: Constants.passwordMustHave6Digits,
                                                                                   target: target)) }
        guard value.count <= 12 else { return Result.error(ValidationError.specific(message: Constants.passwordMustHaveLessThan12Digits,
                                                                                    target: target)) }
        
        return Result.success(value)
    }
}
