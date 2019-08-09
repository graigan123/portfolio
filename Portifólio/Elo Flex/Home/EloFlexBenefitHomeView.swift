//
//  EloFlexBenefitHomeView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class EloFlexBenefitHomeView: BaseView{
    private let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBackground
        return view
    }()
    
    lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.backgroundColor = .white
        return layoutView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.backgroundColor = .lightBackground
        tableView.register(EloFlexBenefitHomeTableViewCell.self, forCellReuseIdentifier: EloFlexBenefitHomeTableViewCell.identifier)
        return tableView
    }()
    
    override func initialize() {
        addSubview(spaceView)
        addSubview(whiteView)
        whiteView.addSubview(tableView)
    }
    
    override func installConstraints() {
        spaceView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(25)
        }
        whiteView.snp.makeConstraints { (make) in
            make.top.equalTo(spaceView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(spaceView.snp.bottom).offset(5)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}


