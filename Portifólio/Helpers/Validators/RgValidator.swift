//
//  RgValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//
import Foundation

class RgValidator: SuperValidator { }

extension RgValidator: ValidatorConvertible {
    struct Constants {
        static let rgMustHave11to9Digits = String.localized(by: "rgMustHave11to9Digits")
    }
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        guard 9...11 ~= value.count else { return Result.error(ValidationError.specific(message: Constants.rgMustHave11to9Digits,
                                                                                        target: target)) }


        return Result.success(value)
    }
}
