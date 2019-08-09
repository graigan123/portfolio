//
//  CatSignInViewController.swift
//  Elo
//
//  Created by Islas on 6/17/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import LocalAuthentication
import Sentry

class CatSignInViewController: SnackBarErrorViewController {
    private(set) lazy var signInView: CatSignInView = {
        let signInView = CatSignInView()
        signInView.cpfTextField.delegate = self
        signInView.signUpButton.addTarget(self, action: #selector(didTapOnSignUpButton), for: .touchUpInside)
        signInView.loginButton.addTarget(self, action: #selector(didTapOnLogin), for: .touchUpInside)
        signInView.forgotPasswordButton.addTarget(self, action: #selector(didTapRecoveryPassword), for: .touchUpInside)
        
        let authBiometric = UserDefaults.standard.bool(forKey: "biometric")
        if authBiometric {
            signInView.biometricButton.addTarget(self, action: #selector(biometricFunction), for: .touchUpInside)
        } else {
            signInView.biometricStackView.isHidden = true
        }
        return signInView
    }()
    private(set) var viewModel: CatSignInViewModelProtocol
    var navigator: CatSigninNavigator?
    
    // MARK: Life Cycle
    init(viewModel: CatSignInViewModelProtocol = CatSignInViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableIQKeyboardManager()
        configBinds()
        hideKeyboardWhenTappedAround()
        if let nav = navigationController as? CatEloNavigationController{

        }

        navigator = CatSigninNavigator(navigationController: navigationController!)

        #if DEBUG

        let event = Event(level: .debug)
        event.message = "testando debug"
        Client.shared?.send(event: event) { (error) in
            // Optional callback after event has been sent
            if let error = error {
                print("valor pego do Sentry: \(error)")
            }
        }
        signInView.cpfTextField.text = "531.974.850-76"
        signInView.passwordTextField.text = "islas123"
        #endif
        Defaults.reset()
    }
    
    override func loadView() {
        super.loadView()
        
        view = signInView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        disableIQKeyboardManager()
    }
    
    // MARK: Actions
    @objc private func didTapOnSignUpButton() {
        navigator?.navigate(to: .signUp)
    }
    
    @objc private func didTapOnLogin() {
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        let cpfResult = signInView.cpfTextField.validateText(validationType: .requiredField(field: ""))
        let passwordResult = signInView.passwordTextField.validateText(validationType: .password)
        
        guard let cpf = try? cpfResult.get(),
            let password = try? passwordResult.get() else {
                return
        }
        viewModel.postSignIn(userName: cpf, password: password) { [weak self] (status) in
            guard let self = self else { return }
            if status {
                self.navigator?.start(destination: .login)//
            }
        }
        
        return
    }
    
    @objc private func didTapRecoveryPassword() {
        navigator?.navigate(to: .recoveryPassword)
//        viewModel.needToRecoverPassword()
    }
    
    // MARK: Functions
    private func configBinds() {
        viewModel.error.bind { [weak self] msg in
            guard let self = self else { return }
            self.navigator?.navigateModal(to: .fail, msg: msg ?? "Error ao realizar login")
        }
        
        
        
        
        viewModel.loading.bind { [weak self] loading in
            guard let self = self else { return }
            self.signInView.loginButton.isEnabled = !loading
            self.signInView.signUpButton.isEnabled = !loading
            loading ? self.showLoader() : self.hideLoader()
        }
    }
    
    @objc func biometricFunction() {
        
        let authBiometric = UserDefaults.standard.bool(forKey: "biometric")
    
        if authBiometric {
            let context: LAContext = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Desbloquear usando o touch ID.") { [weak self] (wasCorrect, error) in
                    
                    guard let self = self else { return }
                    
                    if wasCorrect {
                        
                        let tuppla = Defaults.catLoadCredentials()
                        
                        DispatchQueue.main.async {
                            
                            let userCpf = self.formattedCPF(cpf: tuppla?.cpf)
                            
                            self.signInView.cpfTextField.text = (userCpf ?? "")
                            self.signInView.passwordTextField.text = tuppla?.password ?? ""
                            
                            self.didTapOnLogin()
                        }
                        
                    } else {
                        print("incorrect")
                    }
                }
            }
        }
    }
}

extension CatSignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return GeneralFormatter.cpf.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
    }
}

extension CatSignInViewController {

    func formattedCPF(cpf: String?) -> String? {
        
        guard  let cpf = cpf else { return self.signInView.cpfTextField.text}

        var charact = Array(cpf)
        charact.insert(".", at: 3)
        charact.insert(".", at: 7)
        charact.insert("-", at: 11)
        let masked = String(charact)
        return masked
    }
}
