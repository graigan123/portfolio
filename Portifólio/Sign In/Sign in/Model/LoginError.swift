//
//  LoginError.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct LoginError: Error, Codable{
    let data: LoginErrorData?
    let message: String?
}

struct LoginErrorData: Codable{
    let code: String?
    let message: String?
}
