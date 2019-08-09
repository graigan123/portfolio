//
//  CatEnvironment.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
public struct CatEnvironment {
    
    private static let environmentFile = Bundle.main.path(forResource: "CatEnvironment", ofType: "plist")
    
    public static var baseUrl: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let url = environmentDictionary["URL_BASE"] as? String
            else {
                fatalError("URL_BASE not found in Environment.plist")
        }
        return url
    }()
    
    
    public static var clientId: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let clientId = environmentDictionary["client_id"] as? String
            else {
                fatalError("CLIENT_ID not found in Environment.plist")
        }
        return clientId
    }()
    
    public static var flexBaseUrl: String = {
    
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let flexBaseURL = environmentDictionary["flex_URL_BASE"] as? String
            else {
                fatalError("flex_URL_BASE not found in Environment.plist")
        }
        return flexBaseURL
    }()
    
    public static var XApplicationId: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let XApplicationId = environmentDictionary["X-Application-Id"] as? String  else {
            fatalError("X-Application-Id not found in Environment.plist")
        }
        return XApplicationId
    }()
    
    public static var XApplicationKey: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let XApplicationKey = environmentDictionary["X-Application-Key"] as? String  else {
                fatalError("X-Application-Key not found in Environment.plist")
        }
        return XApplicationKey
    }()
    
    public static var flexClientId: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let flexClientId = environmentDictionary["flex_client_id"] as? String  else {
                fatalError("flex_client_id not found in Environment.plist")
        }
        return flexClientId
    }()
    
    
    /*
     
     public static var fourAllUrl: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["URL_4ALL"] as? String
     else {
     fatalError("URL_4ALL not found in Environment.plist")
     }
     return url
     }()
     
     public static var vipRoomUrl: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["VIP_ROOM"] as? String
     else {
     fatalError("VIP_ROOM not found in Environment.plist")
     }
     return url
     }()
     
     public static var googleMapsKey: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["GOOGLEMAPS_KEY"] as? String
     else {
     fatalError("URL_4ALL not found in Environment.plist")
     }
     return url
     }()
     
     public static var baseUrl: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["URL_BASE"] as? String
     else {
     fatalError("URL_BASE not found in Environment.plist")
     }
     return url
     }()
     
     public static var eloBaseUrl: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["URL_BASE_ELO"] as? String
     else {
     fatalError("URL_BASE_ELO not found in Environment.plist")
     }
     return url
     }()
     
     public static var clientId: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let clientId = environmentDictionary["CLIENT_ID"] as? String
     else {
     fatalError("CLIENT_ID not found in Environment.plist")
     }
     return clientId
     }()
     
     public static var vaultUrl: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["URL_VAULT"] as? String
     else {
     fatalError("URL_VAULT not found in Environment.plist")
     }
     return url
     }()
     
     public static var oneSignalAppId: String = {
     guard let environmentFile = environmentFile,
     let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
     let url = environmentDictionary["ONE_SIGNAL_APP_ID"] as? String
     else {
     fatalError("ONE_SIGNAL_APP_ID not found in Environment.plist")
     }
     return url
     }()
     
     */
    
}
