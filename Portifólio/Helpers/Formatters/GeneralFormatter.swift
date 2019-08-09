//
//  GeneralFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum GeneralFormatter {
    case cpf
    case phone
    case DDDPhone
    case cep
    case date
    case uppercase
    case creditcard
    case shortDate
    case custom(formatter: CustomFormatter)
    
    var formatter: CustomFormatter {
        switch self {
        case .cpf:
            return CPFFormatter()
            
        case .phone:
            return PhoneFormatter()
            
        case .DDDPhone:
            return DDDPhoneFormatter()
            
        case .cep:
            return CEPFormatter()
            
        case .date:
            return TimeFormatter()
            
        case .shortDate:
            return TimeFormatter2()
            
        case .uppercase:
            return UppercaseFormatter()
        
        case .creditcard:
            return CreditCardFormatter()

        case .custom(let formatter):
            return formatter
        }
    }
    
    public func format(value: String) -> String {
        return formatter.format(value: value)
    }
    
    public func formatTextField(_ textField: UITextField,
                                shouldChangeCharactersIn range: NSRange,
                                replacementString string: String) -> Bool {
        return formatter.shouldChangeCharacters(of: textField, inRange: range, typedText: string)
    }
}
