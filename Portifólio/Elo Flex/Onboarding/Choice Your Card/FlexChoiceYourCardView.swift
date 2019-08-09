//
//  FlexChoiceYourCardView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexChoiceYourCardView: BaseView {
    
    //MARK: - TOP
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.layer.borderWidth = 0.0
        view.layer.borderColor = UIColor.clear.cgColor
        
        view.dropShadow()
        
        return view
    }()
    let topLabel: UILabel = {
        let label = UILabel.paragraph(size: .large)
        
        let formattedString = NSMutableAttributedString()
        formattedString
            .boldHeader("Cartões Cadastrados", sizeSE: 19.0)
        
        label.attributedText = formattedString
        label.textAlignment = .center
        return label
    }()
    let subTopLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Legal! Agora selecione o cartão e aproveite os benefícios."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MAKR: - Main
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let bottonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    let floatingButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Adicionar mais cartões", for: .normal)
        return button
    }()
    
    override func initialize() {
        addSubview(topView)
        addSubview(mainView)
//        addSubview(bottonView)
        topView.addSubview(topLabel)
        topView.addSubview(subTopLabel)
        mainView.addSubview(tableView)
//        bottonView.addSubview(floatingButton)
        
    }
    
    override func installConstraints() {
        
        topView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
//            $0.bottom.equalTo(mainView.snp.top).inset(12)
        }
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(50)
        }
        subTopLabel.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(20)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(12)
            $0.leading.equalToSuperview()//.inset(12)
            $0.trailing.equalToSuperview()//.inset(6)
            $0.bottom.equalToSuperview()//.inset(12)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12)
        }
//
//        bottonView.snp.makeConstraints {
//
//
////            $0.width.equalTo(120)
//            $0.leading.equalToSuperview().inset(12)
//            $0.trailing.equalToSuperview().inset(12)
//            $0.bottom.equalToSuperview().inset(12)
//        }
//
//        floatingButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(40)
//            $0.bottom.equalToSuperview().inset(40)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(Int.buttonWidth)
//            $0.height.equalTo(Int.buttonHeight)
//        }
        
        
    }
    
}

class FlexChoiceYourCardFooter: BaseView {
    
    let button: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Adicionar mais cartões", for: .normal)
        return button
    }()
    
    override func initialize() {
        addSubview(button)
    }
    override func installConstraints() {
        button.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
