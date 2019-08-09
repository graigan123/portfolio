//
//  CustomFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public protocol CustomFormatter {
    func format(value: String) -> String
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool
}

extension CustomFormatter {
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String, maxLength: Int, isDigitsOnly: Bool = true) -> Bool {
        let currentText = NSString(string: textField.text ?? "")
        
        var result = format(value: currentText.replacingCharacters(in: range, with: typedText))
        
        if result.count > maxLength {
            result = result.substring(to: result.index(result.startIndex, offsetBy: maxLength))
        }
        
        textField.text = result
        textField.sendActions(for: .editingChanged)
        
        return false
    }
}
