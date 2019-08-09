//
//  CatSignInView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 26/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import MaterialTextField
import UIKit
import LocalAuthentication

enum BiometricType {
    case none
    case touch
    case face
}

public class CatSignInView: BaseView {
    struct Constants {
        static let cpf = String.localized(by: "signInCpf")
        static let password = String.localized(by: "signInPassword")
        static let loginButtonTitle = String.localized(by: "signInLoginButtonTitle")
        static let singUpButtonTitle = String.localized(by: "signInSingUpButtonTitle")
        static let topLabelText = String.localized(by: "signInTopText")
        static let bottomLabeltext = String.localized(by: "signInBottomText")
        static let forgotPasswordButtonTitle = String.localized(by: "signInForgotPasswordButtonTitle")
        static let logoImageName = "eloLogo"
        static let passwordIconEye = "eyeIcon"
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let cpfTextField: MFTextField = {
        let textField = MFTextField()
        textField.placeholder = Constants.cpf
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = UIColor.black
        textField.errorColor = UIColor.black
        return textField
    }()
    let passwordTextField: MFSecuryTextField = {
        let textField = MFSecuryTextField()
        textField.placeholder = Constants.password
        textField.isSecureTextEntry = true
        textField.tintColor = UIColor.black
        textField.errorColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            textField.textContentType = .password
        }
        textField.rightImage = UIImage(named: Constants.passwordIconEye)
        return textField
    }()
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.logoImageName))
        return imageView
    }()
    let loginButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        return button
    }()
    let signUpButton: CatEloButton = {
        let button = CatEloButton()
        button.setTitle(Constants.singUpButtonTitle, for: .normal)
        return button
    }()
    
    let biometricStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8.0
        stack.distribution = .fillProportionally
        stack.alignment = .center
        return stack
    }()
    
    let bioImageView: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    let bioLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.museo300Font(ofSize: 14)
        return label
    }()
    
    let biometricButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .clear
        button.backgroundColor = .clear
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitle(Constants.forgotPasswordButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.museo300Font(ofSize: 14)
        return button
    }()
    let topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.museo700Font(ofSize: 19)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.topLabelText
        return label
    }()
    let bottomLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.bottomLabeltext
        label.textColor = .greyTextColor
        return label
    }()
    
    let appVersionLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Sem versão"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Sem Build"
        
        
        label.text = "V" + version + "." + build
        label.textColor = UIColor.lightGrayText
        return label
    }()
    
    public override func initialize() {
        if self.biometricType() == .face {
            
            self.bioImageView.image = UIImage(named: "faceid")
            self.bioLabelView.text = "Face ID"
        } else {
            self.bioImageView.image = UIImage(named: "Vectorbio")
            self.bioLabelView.text = "Leitor digital"
        }
        addSubview(contentView)
        contentView.addSubview(scrollView)
        scrollView.addSubview(topLabel)
        scrollView.addSubview(appVersionLabel)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(cpfTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(signUpButton)
        scrollView.addSubview(biometricStackView)
        biometricStackView.addArrangedSubview(bioImageView)
        biometricStackView.addArrangedSubview(bioLabelView)
        scrollView.addSubview(biometricButton)
        scrollView.addSubview(forgotPasswordButton)
        scrollView.addSubview(bottomLabel)
    }
    
    public override func installConstraints() {
        backgroundColor = .lightBackground
        setupScrollView()
        setUpLogoImageAndTopLabel()
        setUpFields()
        setUpButtons()
    }
    
    fileprivate func setupScrollView() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
        }
    }
    
    fileprivate func setUpLogoImageAndTopLabel() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(38)
            make.height.equalTo(42)
            make.width.equalTo(63)
            make.centerX.equalToSuperview()
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(65)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        appVersionLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(14)
        }
    }
    
    fileprivate func setUpFields() {
        cpfTextField.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(cpfTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(cpfTextField.snp.leading)
            make.trailing.equalTo(cpfTextField.snp.trailing)
        }
    }
    
    fileprivate func setUpButtons() {
        
        biometricStackView.snp.makeConstraints {
            $0.centerY.equalTo(forgotPasswordButton.snp.centerY)
            $0.leading.equalTo(passwordTextField.snp.leading)
            $0.width.equalTo(140)
            $0.height.equalTo(30)
        }
        
        biometricButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(4)
            $0.leading.equalTo(loginButton.snp.leading)
            $0.width.equalTo(140)
            $0.height.equalTo(40)
            
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(4)
            make.trailing.equalToSuperview().inset(Int.marginRight)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(Int.buttonHeight)
            make.width.equalTo(Int.buttonWidth)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(bottomLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(Int.buttonHeight)
            make.width.equalTo(Int.buttonWidth)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    
    fileprivate func biometricType() -> BiometricType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch(authContext.biometryType) {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
        }
    }
}
