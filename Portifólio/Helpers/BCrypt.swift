//
//  BCrypt.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//
import UIKit

protocol BCryptProtocol: AnyObject {
    func generateHash(username: String, password: String) -> String?
}

final class BCrypt {
    func generateHash(username: String, password: String) -> String? {
        let preSalt = username.generateSalt()
        
        let salt = "$2a$12$" + preSalt
        let password = password.sha256()
        
        return BCryptSwift.hashPassword(password, withSalt: salt)
    }
}

extension BCrypt: BCryptProtocol { }
