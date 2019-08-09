//
//  ProfileModel.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//
import Foundation

struct Profile: Codable{

    var username, firstName, name, lastName: String
    var displayName: String?
    var contacts: [Contacts]
    var birthday: String
    var addresses: [Address]
    var legalIds: LegalIds
    var image: Image?
    var cardHolders: [CardHolder]
    
    struct Image: Codable {
        var url: URL
    }
    
    struct LegalIds: Codable {
        var cpf: Cpf
    }
    
    struct Cpf: Codable {
        var number: String
    }
    
    struct CardHolder: Codable {
        let id: String
        let companyName: String?
        let companyLegalName: String?
    }

}
