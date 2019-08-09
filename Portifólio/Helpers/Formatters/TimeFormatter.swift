//
//  TimeFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//
import UIKit

struct TimeFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)

        if formattedString.count > 2 {
            formattedString.insert("/", at: 2)
        }
        if formattedString.count > 5 {
            formattedString.insert("/", at: 5)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 10)
    }
}

struct TimeFormatter2: CustomFormatter{
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 2 {
            formattedString.insert("/", at: 2)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 5)
    }
    
}
