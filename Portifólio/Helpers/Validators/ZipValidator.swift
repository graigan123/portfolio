//
//  ZipValidator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//
import Foundation

//ZipValidator

import Foundation
class ZipValidator: SuperValidator { }

extension ZipValidator: ValidatorConvertible {
    struct Constants {
        static let cpfInvalid = "CEP inválido"
    }
    
    func validated(_ value: String) -> Result<String> {
        guard !value.isEmpty else { return Result.error(ErrorDefault(data: nil, message: "O preeenchimento do campo é obrigatório", fields: "O preeenchimento do campo é obrigatório")) }
        do {
            if try NSRegularExpression(pattern: ValidatorsConstants.Regex.zip,
                                       options: .caseInsensitive).firstMatch(in: value,
                                                                             options: [],
                                                                             range: NSRange(location: 0,
                                                                                            length: value.count)) == nil {
                return Result.error(ErrorDefault(data: nil, message: Constants.cpfInvalid, fields: Constants.cpfInvalid))
            }
        } catch {
            return Result.error(ErrorDefault(data: nil, message: Constants.cpfInvalid, fields: Constants.cpfInvalid))
        }
        return Result.success(value)
    }
}
