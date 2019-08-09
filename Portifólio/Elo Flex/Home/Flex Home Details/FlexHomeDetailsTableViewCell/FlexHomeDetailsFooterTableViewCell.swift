//
//  FlexHomeDetailsFooterTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsFooterTableViewCell: UITableViewCell {
    
    static let reusableIdentifier: String = "FlexHomeDetailsFooterTableViewCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let termButton: UIButton = {
        let button = UIButton()
        
        var attrs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : (AppDelegate.isIphoneSE ? UIFont.museo500Font(ofSize: 15) : UIFont.museo500Font(ofSize: 17)),
            NSAttributedString.Key.foregroundColor : UIColor.greyText,
            NSAttributedString.Key.underlineStyle : 1]
        let buttonTitleStr = NSMutableAttributedString(string:"Termos e Condições", attributes:attrs)
        
        button.setAttributedTitle(buttonTitleStr, for: .normal)
        
        button.layer.borderWidth = 0.0
        button.backgroundColor = .clear
        
        return button
    }()
    let actionButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Acionar Benefício", for: .normal)
        return button
    }()
    let changeButton: CatEloButton = {
        let button = CatEloButton()
        button.setTitle("Quer trocar seus benefícios?", for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(spaceView)
        spaceView.addSubview(termButton)
        spaceView.addSubview(actionButton)
        spaceView.addSubview(changeButton)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        termButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        actionButton.snp.makeConstraints {
            $0.top.equalTo(termButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Int.buttonHeight)
            $0.width.equalTo(Int.buttonWidth)
        }
        changeButton.snp.makeConstraints {
            $0.top.equalTo(actionButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Int.buttonHeight)
            $0.width.equalTo(Int.buttonWidth)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
