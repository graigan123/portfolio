//
//  LoginResponse.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct LoginResponse: Codable{
    let accessToken: String?
    let customerId: String?
    let userId: String?
    let validUntil: String?
    let profile: UserCat
}

struct RegisterResponse: Codable {
    let accessToken: String?
    let customerId: String?
    let userId: String?
    let validUntil: String?
}
