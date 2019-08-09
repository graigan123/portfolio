//
//  CPFValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class CpfValidator: SuperValidator { }

extension CpfValidator: ValidatorConvertible {
    struct Constants {
        static let cpfInvalid = String.localized(by: "invalidCpf")
    }

    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg,
                                                                                      target: target)) }
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.cpf,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return Result.error(ValidationError.specific(message: Constants.cpfInvalid, target: target))
            }
        } catch {
            return Result.error(ValidationError.specific(message: Constants.cpfInvalid, target: target))
        }
        return Result.success(value)
    }
}
