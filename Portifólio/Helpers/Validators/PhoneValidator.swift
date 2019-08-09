//
//  PhoneValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class PhoneValidator: SuperValidator { }

extension PhoneValidator: ValidatorConvertible {
    struct Constants {
        static let invalidPhone = String.localized(by: "invalidPhone")
    }
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        guard value.digitsOnly.count == 11 else { return Result.error(ValidationError.specific(message: Constants.invalidPhone,
                                                                                   target: target)) }

        return Result.success(value)
    }
}


class BrPhoneValidator: SuperValidator {}
extension BrPhoneValidator: ValidatorConvertible{
    struct Constants {
        static let invalidPhone = String.localized(by: "invalidPhone")
    }
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        guard value.digitsOnly.count == 13 else { return Result.error(ValidationError.specific(message: Constants.invalidPhone,
                                                                                               target: target)) }
        
        return Result.success(value)
    }
}

//364.507.780-40
