//
//  FlexPopupView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 23/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexPopupView: BaseView {
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 91/255, green: 92/255, blue: 90/255, alpha: 0.5)
        return view
    }()
    
    var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.eloGreen
        label.backgroundColor = .white
        label.font = UIFont.museo700Font(ofSize: 19)
        label.textAlignment = .center
        label.text = "Falha"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "error")
        return image
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.35, alpha: 1)
        label.numberOfLines = 0
        label.text = "Confirme com a sua senha de usuário a ativação da biometria."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let passwordTextField: MFSecuryTextField = {
//        let textField = MFSecuryTextField()
//        textField.placeholder = "Senha"
//        textField.isSecureTextEntry = true
//        textField.tintColor = UIColor.black
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        if #available(iOS 11.0, *) {
//            textField.textContentType = .password
//        }
//        textField.rightImage = UIImage(named: "eyeIcon")
//        return textField
//    }()
    
//    var settingButton: CatEloButtonBlack = {
//        let button = CatEloButtonBlack()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Confirmar senha", for: .normal)
//        return button
//    }()
    
    override func initialize() {
        self.backgroundColor = .clear
        addSubview(backView)
        backView.addSubview(whiteView)
//        whiteView.addSubview(scrollView)
        whiteView.addSubview(closeButton)
        whiteView.addSubview(imageView)
//        scrollView.addSubview(titleLabel)
        whiteView.addSubview(descriptionLabel)
//        scrollView.addSubview(passwordTextField)
//        scrollView.addSubview(settingButton)
    }
    
    override func installConstraints() {
        setBackView()
        setWhiteView()
//        setScrollViewConstraints()
        setCloseButton()
        setImage()
//        setTitleLabel()
        setDescriptionLabel()
//        setPasswordTextField()
//        setSettingButton()
    }
    
    func setBackView() {
        backView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setWhiteView() {
        whiteView.snp.makeConstraints {
            $0.height.equalTo(330)
            $0.leading.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
//    func setScrollViewConstraints() {
//        scrollView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
    
    func setImage() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setCloseButton() {
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
    }
    
    func setTitleLabel() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setDescriptionLabel() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
//
//    func setPasswordTextField() {
//        passwordTextField.snp.makeConstraints {
//            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
//            $0.leading.equalToSuperview().inset(20)
//            $0.trailing.equalToSuperview().inset(20)
//        }
//    }
    
//    func setSettingButton() {
//        settingButton.snp.makeConstraints {
//            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
//            $0.leading.equalToSuperview().inset(20)
//            $0.trailing.equalToSuperview().inset(20)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(Int.buttonWidth)
//            $0.height.equalTo(Int.buttonHeight)
//            $0.bottom.equalTo(30)
//        }
//    }
    

}
