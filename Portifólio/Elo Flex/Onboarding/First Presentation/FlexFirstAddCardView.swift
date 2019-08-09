//
//  FlexFirstAddCardView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
//GroupblueCardPlus


class FlexFirstAddCardView: BaseView {
    
    let contView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eloLogo")
        return image
    }()
    
    let imageView: UIImageView = {
        let imag = UIImageView()
        imag.contentMode = .scaleAspectFit
        
        imag.image = UIImage(named: "GroupblueCardPlus")
        
        return imag
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        
        if AppDelegate.isIphoneSE{
            label.font = UIFont(name: "Museo-700", size: 26) ?? .boldSystemFont(ofSize: 26)
        }else{
            label.font = UIFont(name: "Museo-700", size: 28) ?? .boldSystemFont(ofSize: 28)
        }
        
        label.text = "Adicione \nseu Cartão Elo"
        
        
        return label
    }()
    
//    let subLabel: UILabel = {
//        let label = UILabel.header(size: .small)
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.textColor = UIColor.eloGray
//        return label
//    }()
    
    var subLabel: UILabel = {
        let label = UILabel()//.header(size: .small)
        
//        if AppDelegate.isIphoneSE{
//            label.font = UIFont(name: "Museo-700", size: 17) ?? .boldSystemFont(ofSize: 17)
//        }else{
//            label.font = UIFont(name: "Museo-700", size: 19) ?? .boldSystemFont(ofSize: 19)
//        }
        
        let formattedString = NSMutableAttributedString()
        formattedString
            .boldHeader("Adicione seu Cartão Elo\n", sizeSE: 17)
            .normal("para poder ter acesso \naos benefícios exclusivos.")
        
        label.attributedText = formattedString
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    
    let button: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Adicionar Cartão", for: .normal)
        return button
    }()
    
    override func initialize() {
        
        addSubview(contView)
        contView.addSubview(imageLogo)
        contView.addSubview(imageView)
        contView.addSubview(mainLabel)
        contView.addSubview(subLabel)
        contView.addSubview(button)
        
    }
    
    override func installConstraints() {
        
        contView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        imageLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(64)
            $0.height.equalTo(44)
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
            $0.centerX.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(68)
            $0.trailing.equalToSuperview().inset(68)
            $0.height.equalTo(72)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(44)
            $0.trailing.equalToSuperview().inset(44)
            $0.height.equalTo(72)
        }
        button.snp.makeConstraints {
//            $0.top.equalTo(subLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
            $0.bottom.equalToSuperview().inset(70)
        }
    }
    
    func bind(mainText: String, subText: String, imageName: String, buttonTitle: String) {
        self.mainLabel.text = mainText
        self.subLabel.text = subText
        self.imageView.image = UIImage(named: imageName)
//        self.button.titleLabel?.text = buttonTitle
        self.button.setTitle(buttonTitle, for: .normal)
    }
    
    func atributedTextBind(subText: NSAttributedString) {
        self.subLabel.text = ""
        self.subLabel.attributedText = subText
    }
}
