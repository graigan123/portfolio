//
//  ErrorModel.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct FlexErrorMessage: Error, Codable {
    
    var fields: EloGraphQL

    struct EloGraphQL: Error, Codable{
        var ELO_GRAPHQL: [String]
        init(eloGrap: [String]) {
            self.ELO_GRAPHQL = eloGrap
        }
    }
    init(fields: EloGraphQL) {
        self.fields = fields
    }
    
}

struct ErrorMessage: Error{
    let message: String
}

struct ErrorModel: Error, Codable {
    let message: String
    let errors: ErrorCat
    
    init(message: String, errors: ErrorCat){
        self.message = message
        self.errors = errors
    }
}

struct ErrorDefault: Codable, Error{
    var data: String?
    var message: String?
    var fields: String?
    var localizedDescription: String{
        if let message = message{
            return message
        }
        return ""
    }
    
    init(data: String?, message: String?, fields: String?){
        self.data = data
        self.message = message
        self.fields = fields
    }
    
}

struct ErrorCat: Error, Codable {
    
    //    var mainMessage: String?
    var element = [String: [String]]()
    
    private struct CustomCodingKeys: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(element: [String: [String]]){
        self.element = element
    }
    
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        for key in container.allKeys {
            do {
                if let keyValue = CustomCodingKeys(stringValue: key.stringValue) {
                    self.element[keyValue.stringValue] = try container.decodeIfPresent([String].self, forKey: keyValue)
                }
            } catch {
                // Silently ignore the error
            }
        }
    }
}

