//
//  AgeValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class AgeValidator: SuperValidator { }

extension AgeValidator: ValidatorConvertible {
    struct Constants {
        static let invalidBirthday = String.localized(by: "invalidBirthday")
    }

    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        
        let calendar = Calendar.current
        let now = Date()
        let dateFormatter = DateFormatter.Date.brasilFormat
        guard let birthday = dateFormatter.date(from: value) else {
            return Result.error(ValidationError.specific(message: Constants.invalidBirthday, target: target))
        }

        guard let age = calendar.dateComponents([.year], from: birthday, to: now).year else {
            return Result.error(ValidationError.specific(message: Constants.invalidBirthday, target: target))
        }
        guard age <= 120 else { return Result.error(ValidationError.specific(message: Constants.invalidBirthday, target: target)) }
        guard age >= 0 else { return Result.error(ValidationError.specific(message: Constants.invalidBirthday, target: target)) }
        return Result.success(value)
    }
}
