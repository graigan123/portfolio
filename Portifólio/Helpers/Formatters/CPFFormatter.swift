//
//  CPFFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct CPFFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 3 {
            formattedString.insert(".", at: 3)
        }
        if formattedString.count > 7 {
            formattedString.insert(".", at: 7)
        }
        if formattedString.count > 11 {
            formattedString.insert("-", at: 11)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 14)
    }
}
