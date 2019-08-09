//
//  PhoneFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct PhoneFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 0 {
            formattedString.insert("+", at: 0)
        }
        
        if formattedString.count > 3 {
            formattedString.insert(" (", at: 3)
        }
        if formattedString.count > 7 {
            formattedString.insert(") ", at: 7)
        }
        
        if formattedString.count > 14 {
            formattedString.insert("-", at: 14)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 19)
    }
}

struct DDDPhoneFormatter: CustomFormatter {

    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 0 {
            formattedString.insert("(", at: 0)
        }
        
        if formattedString.count > 3 {
            formattedString.insert(") ", at: 3)
        }
        
        if formattedString.count > 10 {
            formattedString.insert("-", at: 10)
        }
        return formattedString as String
    }

    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 15)
    }
}
