//
//  DefaultsWrapper.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

struct Defaults {
    static let (userNameKey, cpfKey, userIdKey, accessTokenKey, tokenDateKey, creditCardKey, userPhotoKey) = ("userName",
                                                                                                              "cpf",
                                                                                                              "userId",
                                                                                                              "accessToken",
                                                                                                              "TokenDate",
                                                                                                              "creditCard",
                                                                                                              "userPhoto")
    static let userSessionKey = "com.save.usersession"
    static let cashbackKey = "cashbackKey"
    static let biometryAllowed = "biometryAllowed"
    static let notificationsAllowed = "notificationsAllowed"
    static let recentContactsKey = "recentContactsKey"
    static let onboardingKey = "orboardingKey"
    static let experiedToken = "experiedtoken"
    static let userPhone = "userPhone"
    static let simcardNumber = "simcardNumber"
    static let userPlan = "userPlan"
    static let creditCardDataKey  = "CatCreditCardData"
    static let creditCardsDataKey  = "CatCreditCardData"
    
    
    static let firstOpenApp = "firstOpenedApp"
    
    struct Model {
        var userName: String?
        
        init(_ json: [String: String]) {
            userName = json[userNameKey]
        }
    }

    static func getFirstOpenApp() -> Bool {
        guard let isFirst = UserDefaults.standard.value(forKey: firstOpenApp) else {
            UserDefaults.standard.set(true, forKey: firstOpenApp)
            return true
        }
        return isFirst as! Bool
    }
    
    static func saveFirstOpenApp(value: Bool) {
        UserDefaults.standard.set(value, forKey: firstOpenApp)
    }
    
    static func getCashBackValue() -> Double {
        return UserDefaults.standard.double(forKey: cashbackKey)
    }
    
    static func getTokenDate() -> Date? {
        return UserDefaults.standard.value(forKey: tokenDateKey) as? Date
    }
    
    static func getBiometryAllowed() -> Bool {
        return UserDefaults.standard.bool(forKey: biometryAllowed)
    }
    
    static func getNotificationsAllowed() -> Bool {
        return UserDefaults.standard.bool(forKey: notificationsAllowed)
    }
    
    static func getUserPhoto() -> Data? {
        return UserDefaults.standard.data(forKey: userPhotoKey)
    }
    
    static func getDidShowOnboarding() -> Bool {
        return UserDefaults.standard.bool(forKey: onboardingKey)
    }
    
    static var saveCashbackValue = { (value: Double) in
        UserDefaults.standard.set(value, forKey: cashbackKey)
        UserDefaults.standard.synchronize()
    }
    
    static var saveTokenTime = { (date: Date) in
        UserDefaults.standard.set(date, forKey: tokenDateKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveBiometryAllowed(value: Bool) {
        UserDefaults.standard.set(value, forKey: biometryAllowed)
        UserDefaults.standard.synchronize()
    }
    
    static func saveNotificationsAllowed(value: Bool) {
        UserDefaults.standard.set(value, forKey: notificationsAllowed)
        UserDefaults.standard.synchronize()
    }
    
    static func setDidShowOnboarding() {
        UserDefaults.standard.set(true, forKey: onboardingKey)
        UserDefaults.standard.synchronize()
    }
    
    static func getRecentContactsUsed() -> [Contact] {
        guard let contactsData = UserDefaults.standard.data(forKey: recentContactsKey) else {
            print("'contacs' not found in UserDefaults")
            return []
        }
        
        guard let contactsArray = try? JSONDecoder().decode([Contact].self, from: contactsData) else {
            print("Could not unarchive from contacsData")
            return []
        }
        return contactsArray
    }
    
    static func saveUserPhoto(_ photo: Data) {
        UserDefaults.standard.set(photo, forKey: userPhotoKey)
        UserDefaults.standard.synchronize()
    }
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: userSessionKey)
        UserDefaults.standard.synchronize()
    }
    
    static var saveCreditCard = { (creditCard: CreditCard) in
        let encoder = JSONEncoder()
        if let cardEncoded = try? encoder.encode(creditCard) {
            UserDefaults.standard.set(cardEncoded, forKey: creditCardKey)
        }
    }
    

    static func saveCreditCardData(_ creditCard: CatCreditCardModelResponse) {
        let encoder = JSONEncoder()
        if let cardEncoded = try? encoder.encode(creditCard) {
            UserDefaults.standard.set(cardEncoded, forKey: creditCardDataKey)
        }
    }
    
    static func saveCreditCardData(_ creditCard: CatCreditCardModel) {
        let encoder = JSONEncoder()
        if let cardEncoded = try? encoder.encode(creditCard) {
            UserDefaults.standard.set(cardEncoded, forKey: creditCardDataKey)
        }
    }
    
    static func getCreditCardData() -> CatCreditCardModel? {
        if let savedCreditCardData = UserDefaults.standard.object(forKey: creditCardDataKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCreditCardData = try? decoder.decode(CatCreditCardModel.self, from: savedCreditCardData) {
                return loadedCreditCardData
            }
        }
        return nil
    }
    
    
    static func getCreditCard() -> CreditCard? {
        if let savedCreditCard = UserDefaults.standard.object(forKey: creditCardKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCreditCard = try? decoder.decode(CreditCard.self, from: savedCreditCard) {
                return loadedCreditCard
            }
        }
        return nil
    }
    
    static func removeCard() {
        UserDefaults.standard.removeObject(forKey: creditCardKey)
        UserDefaults.standard.synchronize()
    }
    
    static func reset() {
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.removeObject(forKey: userIdKey)
        UserDefaults.standard.removeObject(forKey: accessTokenKey)
        UserDefaults.standard.removeObject(forKey: tokenDateKey)
        UserDefaults.standard.removeObject(forKey: creditCardKey)
        UserDefaults.standard.removeObject(forKey: userSessionKey)
        UserDefaults.standard.removeObject(forKey: cashbackKey)
        UserDefaults.standard.removeObject(forKey: biometryAllowed)
        UserDefaults.standard.removeObject(forKey: experiedToken)
        
        UserDefaults.standard.removeObject(forKey: UserLoginKeys.accessToken.rawValue)
        UserDefaults.standard.removeObject(forKey: UserLoginKeys.customerId.rawValue)
        UserDefaults.standard.removeObject(forKey: UserLoginKeys.validUntil.rawValue)
        UserDefaults.standard.removeObject(forKey: UserLoginKeys.userId.rawValue)
        UserDefaults.standard.removeObject(forKey: creditCardDataKey)
        UserDefaults.standard.removeObject(forKey: userPhone)
        UserDefaults.standard.removeObject(forKey: userPlan)
        UserDefaults.standard.synchronize()
    }
    
    static func saveContact(contact: Contact) {
        var contacts = getRecentContactsUsed()
        guard !contacts.contains(contact) else { return }
        
        contacts.append(contact)
        if contacts.count > 5 {
            _ = contacts.popLast()
        }
        
        let encoder = JSONEncoder()
        if let contactsEncodded = try? encoder.encode(contacts) {
            UserDefaults.standard.set(contactsEncodded, forKey: recentContactsKey)
        }
    }
    
    static func saveCpf(_ cpf: String) {
        do {
            let cpfItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpfKey,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try cpfItem.savePassword(cpf)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func saveCredentialsAndPassword(credentials: UserCredentials, password: String) {
        saveAccessToken(credentials.accessToken)
        
        guard let cpf = loadCpf() else { return }
         
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpf,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(password)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func saveAccessToken(_ token: String) {
        do {
            let tokenItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: accessTokenKey,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try tokenItem.savePassword(token)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func loadCpf() -> String? {
        do {
            let cpfItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpfKey,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            
            let cpf = try cpfItem.readPassword()
            return cpf
        } catch {
            return nil
        }
    }
    
    static func loadCredentials() -> (cpf: String, password: String)? {
        guard let cpf = loadCpf() else { return nil }
        
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpf,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            
            let keychainPassword = try passwordItem.readPassword()
            
            return (cpf, keychainPassword)
        } catch {
            return nil
        }
    }
    
    static func loadAccessToken() -> String?  {
        do {
            let accessTokentem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: accessTokenKey,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            
            let accessToken = try accessTokentem.readPassword()
            return accessToken
        } catch {
            return nil
        }
    }
    
    static func removeCredentials() throws {
        guard let cpf = loadCpf() else { return }
        let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                account: cpf,
                                                accessGroup: KeychainConfiguration.accessGroup)
        try passwordItem.deleteItem()

        let cpfItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                           account: cpfKey,
                                           accessGroup: KeychainConfiguration.accessGroup)
        try cpfItem.deleteItem()
    }
}

enum UserLoginKeys: String{
    case customerId, userId, validUntil, accessToken
}


extension Defaults{
    
    static func catLoadTokenValidation() -> Bool{
        return UserDefaults.standard.bool(forKey: experiedToken)
    }
    
    static func catSaveAccessToken(accessToken: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(accessToken, forKey: UserLoginKeys.accessToken.rawValue)
    }
    
    static func catGetAccessToken() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: UserLoginKeys.accessToken.rawValue) as? String
    }

    static func catSaveCustomerId(customerId: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(customerId, forKey: UserLoginKeys.customerId.rawValue)
    }

    static func catGetCustomerId() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: UserLoginKeys.customerId.rawValue) as? String
    }
    
    static func catSaveValidUntil(validUntil: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(validUntil, forKey: UserLoginKeys.validUntil.rawValue)
    }
    
    static func catGetValidUntil() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: UserLoginKeys.validUntil.rawValue) as? String
    }
    
    static func catSaveUserId(userId: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(userId, forKey: UserLoginKeys.userId.rawValue)
    }
    
    static func catGetUserId() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: UserLoginKeys.userId.rawValue) as? String
    }
    static func catSaveUserCard(card: CatCreditCardModel?){
        let encoder = JSONEncoder()
        if let cardEncoded = try? encoder.encode(card) {
            UserDefaults.standard.set(cardEncoded, forKey: creditCardDataKey)
        }else{
            UserDefaults.standard.set(nil, forKey: creditCardDataKey)
        }
    }
    static func catGetUserCard() -> CatCreditCardModel?{
        if let savedCreditCardData = UserDefaults.standard.object(forKey: creditCardDataKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCreditCardData = try? decoder.decode(CatCreditCardModel.self, from: savedCreditCardData) {
                return loadedCreditCardData
            }
        }
        return nil
    }
    static func catSaveUserCards(cards: [CatCreditCardModel]?){
        let encoder = JSONEncoder()
        if let cardEncoded = try? encoder.encode(cards) {
            UserDefaults.standard.set(cardEncoded, forKey: creditCardsDataKey)
        }else{
            UserDefaults.standard.set(nil, forKey: creditCardsDataKey)
        }
    }
    static func catGetUserCards() -> [CatCreditCardModel]?{
        if let savedCreditCardData = UserDefaults.standard.object(forKey: creditCardsDataKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCreditCardData = try? decoder.decode(CatCreditCardModel.self, from: savedCreditCardData) {
                return [loadedCreditCardData]
            }
        }
        return nil
    }
    static func catSaveUserPhone(phone: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(phone, forKey: userPhone)
    }
    static func catGetUserPhone() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: userPhone)
    }
    static func catSaveUserSimcardNumber(simcard: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(simcard, forKey: simcardNumber)
    }
    static func catGetUserSimcardNumber() -> String?{
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: simcardNumber)
    }
    static func catSaveUserPlan(plan: Plan){
        let encoder = JSONEncoder()
        if let planEncoded = try? encoder.encode(plan) {
            UserDefaults.standard.set(planEncoded, forKey: userPlan)
        }
        
        DataValues.plan.value = plan
        
        
    }
    
    static func catGetUserPlan() -> Plan?{
        if let savedPlan = UserDefaults.standard.object(forKey: userPlan) as? Data {
            let decoder = JSONDecoder()
            if let loadedPlanData = try? decoder.decode(Plan.self, from: savedPlan) {
                return loadedPlanData
            }
        }
        return nil
    }
    static func catSaveCpf(_ cpf: String) {
        do {
            let cpfItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                               account: cpfKey,
                                               accessGroup: KeychainConfiguration.accessGroup)
            try cpfItem.savePassword(cpf)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func catSaveCredentialsAndPassword(credentials: LoginResponse, password: String) {
        catSaveAccessToken(credentials.accessToken!)
        
        guard let cpf = catLoadCpf() else { return }
        
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpf,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(password)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func catSaveAccessToken(_ token: String) {
        do {
            let tokenItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                 account: accessTokenKey,
                                                 accessGroup: KeychainConfiguration.accessGroup)
            try tokenItem.savePassword(token)
        } catch {
            print("Error updating keychain - \(error)")
        }
    }
    
    static func catLoadCredentials() -> (cpf: String, password: String)? {
        guard let cpf = loadCpf() else { return nil }
        
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: cpf,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            
            let keychainPassword = try passwordItem.readPassword()
            
            return (cpf, keychainPassword)
        } catch {
            return nil
        }
    }
    
    static func catLoadCpf() -> String? {
        do {
            let cpfItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                               account: cpfKey,
                                               accessGroup: KeychainConfiguration.accessGroup)
            
            let cpf = try cpfItem.readPassword()
            return cpf
        } catch {
            return nil
        }
    }
}
