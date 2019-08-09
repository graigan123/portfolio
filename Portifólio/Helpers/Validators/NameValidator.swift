//
//  NameValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
class NameValidator: SuperValidator { }

extension NameValidator: ValidatorConvertible {
    struct Constants {
        static let cpfInvalid = "Nome inválido"
    }
    
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ErrorDefault(data: nil, message: "O preeenchimento do campo é obrigatório", fields: "flex error")) }
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.alphabet,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return Result.error(ErrorDefault(data: nil, message: "Nome inválido", fields: "flex error"))
            }
        } catch {
            return Result.error(ErrorDefault(data: nil, message: "Nome inválido", fields: "flex error"))
        }
        return Result.success(value)
    }
}
