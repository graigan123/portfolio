//
//  UppercaseFormatter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct UppercaseFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        return value.uppercased()
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 6)
    }
}
