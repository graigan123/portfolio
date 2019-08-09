//
//  DateValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FutureDateValidator: SuperValidator { }

extension FutureDateValidator: ValidatorConvertible {
    struct Constants {
        static let invalidDate = String.localized(by: "invalidDate")
        static let dateGreaterThanToday = String.localized(by: "dateGreaterThanToday")
    }
    
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        let dateFormatter = DateFormatter.Date.brasilFormat
        guard let date = dateFormatter.date(from: value) else {
            return Result.error(ValidationError.specific(message: Constants.invalidDate, target: target))
        }
        
        let now = Date()
        
        if date <= now || Calendar.current.isDateInToday(date) {
            return Result.error(ValidationError.specific(message: Constants.dateGreaterThanToday, target: target))
        }
        
        return Result.success(value)
    }
}
