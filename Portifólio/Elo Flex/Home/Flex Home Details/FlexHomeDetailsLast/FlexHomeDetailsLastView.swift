//
//  FlexHomeDetailsLastView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexHomeDetailsLastView: BaseView {
    
    let spaceView: UIView = {
        let view = UIView()
        return view
    }()
    
    var topView: UIView = {
        let view = UIView()
        return view
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Película Protetora"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var detailsLabel: UILabel = {
        let label = UILabel.paragraph(size: .small)
        
        let formattedString = NSMutableAttributedString()
        formattedString.normal("Aplicada sobre o couro para proteger e hidratar o banco, ")
            
        if AppDelegate.isIphoneSE {
            let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.museo500Font(ofSize: 12),
                                                        .foregroundColor: UIColor.black]
            let boldString = NSMutableAttributedString(string:"evitando ", attributes: attrs)
            formattedString.append(boldString)
        } else {
            let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.museo500Font(ofSize: 14),
                                                        .foregroundColor: UIColor.black]
            let boldString = NSMutableAttributedString(string:"evitando ", attributes: attrs)
            formattedString.append(boldString)
        }

        formattedString.normal("rachaduras e ressecamentos.")
        
        label.attributedText = formattedString
        
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let mainView: UIView = {
        let view = UIView()
        return view
    }()
    var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(FlexHomeDetailsLastTableViewCell.self, forCellReuseIdentifier: FlexHomeDetailsLastTableViewCell.reusableIdentifier)
        tableView.register(FlexHomeDetailsLastTableViewFooterCell.self, forCellReuseIdentifier: FlexHomeDetailsLastTableViewFooterCell.reusableIdentifier)
        tableView.register(FlexHomeDetailsFooterChangeCell.self, forCellReuseIdentifier: FlexHomeDetailsFooterChangeCell.reusableIdentifier)
        return tableView
    }()
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(topView)
        topView.addSubview(imageView)
        topView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(detailsLabel)
        
        spaceView.addSubview(mainView)
        mainView.addSubview(tableView)
    }
    override func installConstraints() {
        
        spaceView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(300)  //200 + 140
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        titleView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(30)
        }
        detailsLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
