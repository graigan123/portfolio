//
//  FlexHomeDetailsPopUpView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsPopUpView: BaseView {
    
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
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.eloGreen
        label.backgroundColor = .white
        label.font = UIFont.museo700Font(ofSize: 19)
        label.textAlignment = .center
        label.text = "Acionar Benefício"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Agora basta ligar e digitar o código 0351 para acionar."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var viewCard: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black//UIColor.eloGray
        return view
    }()
    var downLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.eloGray
        return view
    }()
    var cardLabel: UILabel = {
        let label = UILabel.header(size: .extraSmall)
        label.text = "Cartão Elo final **** 5550"
        label.textAlignment = .center
        return label
    }()
    var numberLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "+55 (11) 9 9999 9999"
        label.textAlignment = .center
        return label
    }()
    var actionButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Ligar", for: .normal)
        return button
    }()

    
    
    override func initialize() {
        self.backgroundColor = .clear
        addSubview(backView)
        backView.addSubview(whiteView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(closeButton)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(viewCard)
        whiteView.addSubview(topLineView)
        viewCard.addSubview(cardLabel)
        whiteView.addSubview(downLineView)
        
        whiteView.addSubview(numberLabel)
        whiteView.addSubview(actionButton)
        
        bringSubviewToFront(topLineView)
        bringSubviewToFront(downLineView)
    }
    
    override func installConstraints() {
        backView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        whiteView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(35)
            $0.trailing.equalToSuperview().inset(35)
            $0.height.equalTo(50)
        }
        
        viewCard.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        topLineView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.width.equalTo(2)
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(21)
        }
        downLineView.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.top).offset(20)
            $0.width.equalTo(2)
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(21)
        }
        cardLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(viewCard.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(21)
        }
        actionButton.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(8)
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(35)
        }
        
        
    }
    
}
