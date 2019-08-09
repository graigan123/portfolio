//
//  FlexSignInService.swift
//  Elo
//
//  Created by Diego Vasconcelos on 26/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import Alamofire

class FlexSignInService {
    
    static let shared = FlexSignInService()
    
    var headers: HTTPHeaders = ["Content-Type": "application/json",
                                "X-Application-Id": CatEnvironment.XApplicationId,
                                "X-Organization-Slug": "elo",
                                "X-Application-Key": CatEnvironment.XApplicationKey,
                                "CLIENT_ID": CatEnvironment.flexClientId] as HTTPHeaders
    
    func postSignIn(signInBody: FlexSignInModel, completion: @escaping(Result<FlexSignInResponder?>) -> Void) {
        let url = CatEnvironment.flexBaseUrl + "v1/authentication"
        
        CatAlamofireServices.alamofireManager.request(url, method: .post, parameters: signInBody.valueDictionay, encoding: JSONEncoding.default, headers: headers).response { (defaultResponse) in
            
            guard let response = defaultResponse.response else {
                completion(Result.error(CatApiError.internalErrorServer))
                return
            }
            
            response.flexFilterStatusCode(statusCode: response.statusCode, data: defaultResponse.data!, completion: { (status) in
                
                switch status{
                case .success:
                    guard let data = defaultResponse.data,
                        let loginResponse = try? JSONDecoder().decode(FlexSignInResponder.self, from: data)
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
    
}
