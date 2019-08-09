//
//  FlexAllBenefitsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexAllBenefitsView: BaseView {
    
    var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var futureSearchBar: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorColor = UIColor.clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        
        tableView.register(FlexAllBenefitsTableViewCell.self, forCellReuseIdentifier: FlexAllBenefitsTableViewCell.reusableIdentifier)
        tableView.register(FlexAllBenefitsTableViewCellFooter.self, forCellReuseIdentifier: FlexAllBenefitsTableViewCellFooter.reusebleIdentifier)
        
        return tableView
    }()

    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(futureSearchBar)
        spaceView.addSubview(tableView)
    }
    override func installConstraints() {
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        futureSearchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(futureSearchBar.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
