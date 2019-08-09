//
//  FlexSignInViewModel.swift
//  Elo
//
//  Created by Diego Vasconcelos on 26/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

protocol FlexSignInProtocol: SuperViewModelProtocol {
    func initializetion() 
}


class FlexSignInViewModel: SuperViewModel {
    
    func postSignIn(userName: String, password: String, completion: @escaping(Bool) -> Void) {
        
        let model = FlexSignInModel(username: "04825635326", password: "islas123")
        self.loading.value = true
        FlexSignInService.shared.postSignIn(signInBody: model) { (result) in
            self.loading.value = false
            switch result {
            case .success(let value):
                guard let data = value else {
                    completion(false)
                    return
                }
                Defaults.saveAccessToken(data.token ?? "Sem Token")
                completion(true)
                
            case .error(let error):
                
                if let error = error as? ErrorMessage{
                    self.error.value = error.message
                }else{
                    self.error.value = "Erro no servidor, tente novamente mais tarde"
                }
                completion(false)
                
            }
        }
    }
    
    
}
