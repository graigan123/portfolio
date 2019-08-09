//
//  CreditCardFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct CreditCardFormatter: CustomFormatter {

    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.count > 4 {
            formattedString.insert(" ", at: 4)//insert(".", at: 4)
        }
        if formattedString.count > 9 {
            formattedString.insert(" ", at: 9)//insert(".", at: 9)
        }
        if formattedString.count > 14 {
            formattedString.insert(" ", at: 14)//insert(".", at: 14)
        }

        return formattedString as String
    }

    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 19)
    }
}
