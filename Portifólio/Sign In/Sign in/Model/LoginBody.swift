//
//  LoginBody.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
struct LoginBody{
    let username: String
    let password: String
    
    var dictValue: [String: Any]{
        let dict: [String: Any] = [
            "username": username.cpfClean,
            "password": password
        ]
        return dict
    }
}
