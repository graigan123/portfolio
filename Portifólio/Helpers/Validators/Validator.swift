//
//  File.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case fieldRequired(message: String, target: UIControl?)
    case specific(message: String, target: UIControl?)
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fieldRequired(let msg, _):
            return msg

        case .specific(let msg, _):
            return msg
        }
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) -> Result<String>
}

class SuperValidator {
    var target: UIControl?

    init(target: UIControl) {
        self.target = target
    }
    
    init() {}
}

enum ValidatorType {
    case email
    case password
    case requiredField(field: String)
    case age
    case cpf
    case phone
    case alphabet
    case futureDate
    case rgNumber
    case brPhone
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType, target: UIControl) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator(target: target)
        case .password: return PasswordValidator(target: target)
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName, target: target)
        case .age: return AgeValidator(target: target)
        case .cpf: return CpfValidator(target: target)
        case .phone: return PhoneValidator(target: target)
        case .brPhone: return BrPhoneValidator(target: target)
        case .alphabet: return BrazilianAlphabetValidator(target: target)
        case .futureDate: return FutureDateValidator(target: target)
        case .rgNumber: return RgValidator(target: target)
        }
    }
}

struct ValidatorsConstants {
    static let allFieldsRequiredMsg = String.localized(by: "allFieldsRequired")

    struct Regex {
        static let cpf = "[0-9]{3}\\.?[0-9]{3}\\.?[0-9]{3}\\-?[0-9]{2}"
        static let email = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        static let password = "^(?=.*\\d)(?=.*[a-zA-Z]).{8,}$"
        static let alphabet = "(?i)^(?:(?![×Þß÷þø])[-' a-zÀ-ÿ])+$"
        static let zip = "[0-9]{5}\\-[0-9]{3}"
    }
}

class RequiredFieldValidator: SuperValidator {
    private let fieldName: String
    
    init(_ field: String, target: UIControl) {
        fieldName = field
        super.init(target: target)
    }
}

extension RequiredFieldValidator: ValidatorConvertible {
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else {
            return Result.error(ValidationError.fieldRequired(message: ValidatorsConstants.allFieldsRequiredMsg, target: target))
        }
        return Result.success(value)
    }
}

