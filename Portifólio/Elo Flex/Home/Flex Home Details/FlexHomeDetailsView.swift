//
//  FlexHomeDetailsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexHomeDetailsView: BaseView {
    
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var mainView: UIView = {
        let view = UIView()
        return view
    }()
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FlexHomeDetailsTableViewCell.self, forCellReuseIdentifier: FlexHomeDetailsTableViewCell.reusableIdentifier)
        tableView.register(FlexHomeDetailsFooterTableViewCell.self, forCellReuseIdentifier: FlexHomeDetailsFooterTableViewCell.reusableIdentifier)
        tableView.register(FlexHomeDetailsHeaderCell.self, forCellReuseIdentifier: FlexHomeDetailsHeaderCell.reusableIdentifier)
        tableView.register(FlexHomeDetailsFooterChangeCell.self, forCellReuseIdentifier: FlexHomeDetailsFooterChangeCell.reusableIdentifier)
        return tableView
    }()
    
    override func initialize() {
        addSubview(topView)
        addSubview(mainView)
        mainView.addSubview(tableView)
    }
    override func installConstraints() {
        topView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(200)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func bind(view: UIView) {
        self.topView.addSubview(view)
        view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}
