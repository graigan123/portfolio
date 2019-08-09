//
//  FlexSignInModel.swift
//  Elo
//
//  Created by Diego Vasconcelos on 26/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct FlexSignInModel {
    
    let username: String
    let password: String
    
    var valueDictionay: [String: Any] {
        let value: [String: Any] = ["username": username,
                                    "password": password]
        return value
    }
}

struct FlexSignInResponder: Codable {
    var username: String?
    var token: String?
    var expiry: String?
    
    init(username: String?, token: String, expiry: String) {
        self.username = username
        self.token = token
        self.expiry = expiry
    }
}
