//
//  AddCardHeaderView.swift
//  Elo
//
//  Created by Bruna on 16/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class AddCardHeaderView: BaseView{
    
//    let headerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    
    let greyLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayText
        return view
    }()
    
    var addCardLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Adicionar Cartão Elo"
        label.numberOfLines = 0
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addBtn"), for: .normal)
        return button
    }()
    
    
    override func initialize() {
        addSubview(greyLine)
        addSubview(addCardLabel)
        addSubview(addButton)
    }

    override func installConstraints() {
        addCardLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(92)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(addCardLabel)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        greyLine.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.centerX.equalToSuperview()
            make.top.equalTo(addCardLabel.snp.bottom).offset(22)
            make.height.equalTo(2)
        }
    }
}
