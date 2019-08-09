//
//  CatSignInViewMode.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

enum isChipActivated {
    case active, inactive
}

protocol CatSignInNavigationProtocol: AnyObject {
    func signUpButtonTapped()
    func loginWithSuccess(chipActivated: Bool)
    func needToRecoveryPassword()
}

protocol CatSignInViewModelProtocol: SuperViewModelProtocol {
    func goToSignUp()
    func needToRecoverPassword()
    func login(userName: String, password: String, completion: @escaping (Bool)-> Void)
    func getUserPhoneNumbers(completion: @escaping (Bool)-> Void)
    func getUserCards(completion: @escaping (Bool)-> Void)
    func getUserPlan(completion: @escaping (Bool)-> Void)
    
    func postSignIn(userName: String, password: String, completion: @escaping(Bool) -> Void)
    
}

class CatSignInViewModel: SuperViewModel {
    private var service: CatSignInService!
    let requestGroup = DispatchGroup()
    let navigator: CatSigninNavigator?
    var isChipActivated = true
    init(service: CatSignInService = CatSignInService.instance,
         bcrypt: BCryptProtocol = BCrypt(), navigator: CatSigninNavigator? = nil) {
//        self.navigationDelegate = navigationDelegate
        self.service = service
        self.navigator = navigator
    }
}

extension CatSignInViewModel: CatSignInViewModelProtocol {
    func postSignIn(userName: String, password: String, completion: @escaping(Bool) -> Void) {
        
        let model = FlexSignInModel(username: userName.digitsOnly, password: password)
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
    
    func getUserCards(completion: @escaping (Bool)-> Void) {
        requestGroup.enter()
        self.service.getUserCards { [weak self] result in
            guard let self = self else {return}
                switch result{
                case .success(let creditCard):
                    Defaults.catSaveUserCards(cards: creditCard)
                    Defaults.catSaveUserCard(card: creditCard.first)
                    completion(true)
                    break
                case .error:
                    completion(false)
                    break
                }
        }
    }
    
    func getUserPhoneNumbers(completion: @escaping (Bool)-> Void) {
        self.service.getUserPhone { (result) in
            
            switch result{
            case .success(let phone):
                if phone.phones.isEmpty{
                    self.isChipActivated = false
                    completion(true)
                    return
                }else{
                    Defaults.catSaveUserPhone(phone: phone.phones[0])
                    var cardOk = false
                    var planOk = false
                    self.getUserCards(completion: { (status) in
                        if !status{
                            completion(false)
                            return
                        }
                        cardOk = status
                        self.requestGroup.leave()
                    })
                    self.getUserPlan(completion: { (status) in
                        if !status{
                            completion(false)
                            return
                        }
                        planOk = status
                        self.requestGroup.leave()
                    })
                    self.requestGroup.notify(queue: .main) {
                        if cardOk && planOk{
                            completion(true)
                        }else{
                            completion(false)
                        }
                    }
                }
            case .error(let error):
                completion(false)
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserPlan(completion: @escaping (Bool)-> Void) {
        requestGroup.enter()
        self.service.getUserPlan{ (result) in
            switch result{
            case .success(let plan):
                Defaults.catSaveUserPlan(plan: plan)
                completion(true)
                print("plan = ", plan)
            case .error(let error):
                completion(false)
                print(error.localizedDescription)
            }
        }
    }
    
    func needToRecoverPassword() {
        navigator?.navigate(to: .recoveryPassword)
    }
    
    func login(userName: String, password: String, completion: @escaping (Bool)-> Void) {
        loading.value = true
        DispatchQueue.global(qos: .userInitiated).async {
            self.service.signIn(loginBody: LoginBody.init(username: userName, password: password), completion: { [weak self] (result) in
                guard let self = self else {return}
                switch result{
                case .success(let value):
                    guard let data = value.data, let accessToken = data.accessToken else {fatalError()}
                    UserDefaults.standard.set(false, forKey: "experiedtoken")
                    Defaults.catSaveAccessToken(accessToken: accessToken)
                    Defaults.catSaveCpf(userName.digitsOnly)
                    UserCat.initCurrentUser(user: (value.data?.profile)!)
                    Defaults.catSaveCredentialsAndPassword(credentials: value.data!,
                                                        password: password)
                    
                    self.loading.value = false
                    completion(true)
                case .error(let error):
                    self.loading.value = false
                    if let error = error as? ErrorMessage{
                        self.error.value = error.message
                    }else{
                        self.error.value = "Erro no servidor, tente novamente mais tarde"
                    }
                    
                }
            })
        }
    }
    
    func goToSignUp() {
        navigator?.navigate(to: .signUp)
    }
}
