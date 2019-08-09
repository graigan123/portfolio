//
//  CatSignInService.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import Alamofire

class CatSignInService{
    
    let baseURL: String = CatEnvironment.baseUrl
    var headers: HTTPHeaders = [
        "Client-Id": CatEnvironment.clientId,
        "Accept": "application/json"
    ]
    
    static let instance = CatSignInService()
    
    private init(){}
    
    func signIn(loginBody: LoginBody, completion: @escaping (Result<DefaultResponse<LoginResponse>>) -> Void){
        let url: String = baseURL+"login"
        guard let appVersion = ServicesHelpers.appVersion else {fatalError()}
        headers["App-Version"] = appVersion
        
        let tuppla = Defaults.catLoadCredentials()
        let tuplaCPF: String = tuppla?.cpf ?? ""
        let userCPF: String = loginBody.dictValue["username"] as! String
        if tuplaCPF != userCPF {
            UserDefaults.standard.set(false, forKey: "biometric")
        }
        
        CatAlamofireServices.alamofireManager.request(url, method: .post, parameters: loginBody.dictValue, encoding: JSONEncoding.default, headers: headers).response { (defaultResponse) in
            
            guard let response = defaultResponse.response else {
                completion(Result.error(CatApiError.internalErrorServer))
                return
            }
            
            response.filterStatusCode(statusCode: response.statusCode, data: defaultResponse.data!, completion: { (status) in
                switch status{
                case .success:
                    guard let data = defaultResponse.data,
                        let loginResponse = try? JSONDecoder().decode(DefaultResponse<LoginResponse>.self, from: data)
                        else {
                            completion(Result.error(CatApiError.internalErrorServer))
                            return
                    }
                    completion(Result.success(loginResponse))
                case .error(let errorMessage):
                    completion(Result.error(errorMessage))
                case .multipleErrors(let error):
                    completion(Result.error(ErrorMessage.init(message: error.message)))
                }
            })
        }
    }
    
    func getUserProfileData(_ completion: @escaping (Result<UserParseCat>) -> Void) {
        let url: String = baseURL+"profile"
        guard let authorization = Defaults.catGetAccessToken() else {fatalError()}
        headers["Authorization"] = "Bearer " + authorization
        guard let appVersion = ServicesHelpers.appVersion else {fatalError()}
        headers["App-Version"] = appVersion
        CatAlamofireServices.alamofireManager.request(url, encoding: JSONEncoding.default, headers: headers).response { (defaultDataResponse) in
            
            guard let response = defaultDataResponse.response else {
                completion(Result.error(CatApiError.internalErrorServer))
                return
            }
            
            response.filterStatusCode(statusCode: response.statusCode, data: defaultDataResponse.data!, completion: { (status) in
                switch status{
                case .success:
                    guard let data = defaultDataResponse.data,
                        let userResponse = try? JSONDecoder().decode(DefaultResponse<UserParseCat>.self, from: data)
                        else {
                            completion(Result.error(CatApiError.internalErrorServer))
                            return
                    }
                    completion(Result.success(userResponse.data!))
                case .error(let errorMessage):
                    completion(Result.error(errorMessage))
                case .multipleErrors(let error):
                    completion(Result.error(ErrorMessage.init(message: error.message)))
                }
            })
        }
    }
    
    func getUserPhone(completion: @escaping (Result<Phones>) -> Void){
        let url: String = baseURL+"phones"
        
        guard let authorization = Defaults.catGetAccessToken() else {fatalError()}
        headers["Authorization"] = "Bearer " + authorization
        guard let appVersion = ServicesHelpers.appVersion else {fatalError()}
        headers["App-Version"] = appVersion
        
        CatAlamofireServices.alamofireManager.request(url, encoding: JSONEncoding.default, headers: headers).response { (defaultDataResponse) in
            
            guard let response = defaultDataResponse.response else {
                completion(Result.error(CatApiError.internalErrorServer))
                return
            }
            
            response.filterStatusCode(statusCode: response.statusCode, data: defaultDataResponse.data!, completion: { (status) in
                switch status{
                case .success:
                    guard let data = defaultDataResponse.data,
                        let userResponse = try? JSONDecoder().decode(DefaultResponse<Phones>.self, from: data)
                        else {
                            completion(Result.error(CatApiError.internalErrorServer))
                            return
                    }
                    completion(Result.success(userResponse.data!))
                case .error(let errorMessage):
                    print(errorMessage)
                    completion(Result.error(errorMessage))
                case .multipleErrors(let error):
                    completion(Result.error(ErrorMessage.init(message: error.message)))
                }
            })
        }
    }
    
    func getUserCards(completion: @escaping (Result<[CatCreditCardModel]>) -> Void) {
        let url: String = baseURL+"credit-cards"
        headers["Content-Type"] = "application/json"
        guard let authorization = Defaults.catGetAccessToken() else {fatalError()}
        headers["Authorization"] = "Bearer " + authorization
        guard let phone = Defaults.catGetUserPhone() else {fatalError()}
        headers["Phone"] = phone
        guard let appVersion = ServicesHelpers.appVersion else {fatalError()}
        headers["App-Version"] = appVersion
        
        CatAlamofireServices.alamofireManager.request(url, encoding: JSONEncoding.default, headers: headers).response { (defaultDataResponse) in
            
            guard let response = defaultDataResponse.response else {
                completion(Result.error(CatApiError.internalErrorServer))
                return
            }
        
            response.filterStatusCode(statusCode: response.statusCode, data: defaultDataResponse.data!, completion: { (status) in
                switch status{
                case .success:
                    guard let data = defaultDataResponse.data,
                        let userResponse = try? JSONDecoder().decode(DefaultResponse<[CatCreditCardModel]>.self, from: data)
                        else {
                            completion(Result.error(CatApiError.internalErrorServer))
                            return
                    }
                    completion(Result.success(userResponse.data!))
                case .error(let errorMessage):
                    print(errorMessage)
                    completion(Result.error(errorMessage))
                    return
                case .multipleErrors(let error):
                    completion(Result.error(error))
                }
            })
            
        }
    }
    
    func getUserPlan(completion: @escaping (Result<Plan>) -> Void){
        let url: String = baseURL+"subscription"
        guard let phone = Defaults.catGetUserPhone() else {fatalError()}
        headers["Phone"] = phone
        headers["App-Version"] = ServicesHelpers.appVersion ?? ""
        print(headers)
        
        
        CatAlamofireServices.alamofireManager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).response { (defaultResponse) in
            if let response = defaultResponse.response {
                response.filterStatusCode(statusCode: response.statusCode, data: defaultResponse.data!, completion: { (status) in
                    switch status{
                    case .success:
                        guard let data = defaultResponse.data else {fatalError()}
                        do{
                            let plan = try JSONDecoder().decode(DefaultResponse<Plan>.self, from: data)
                            completion(Result.success(plan.data!))
                        }catch{
                            completion(Result.error(error))
                        }
                    case .error(let errorMessage):
                        print(errorMessage)
                        completion(Result.error(errorMessage))
                    case .multipleErrors(let error):
                        completion(Result.error(error))
                    }
                })
            }else{
                completion(Result.error(CatApiError.internalErrorServer))
            }
            
        }
    }
    
}
