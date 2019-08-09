//
//  FlexHomeView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 22/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FlexHomeView: BaseView {
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CreditCardCollectionViewCell.self, forCellWithReuseIdentifier: CreditCardCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.tag = 0
        
        return collectionView
    }()
    var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    var tablewView: UITableView = {
        let tableView = UITableView()
        tableView.register(FlexHomeEloCardCollectionCell.self, forCellReuseIdentifier: FlexHomeEloCardCollectionCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        
        tableView.register(FlexCardAnimatedCell.self, forCellReuseIdentifier: FlexCardAnimatedCell.reuseIdentifier)
        
        tableView.register(FlexHomeEloTableFooterButtonCell.self, forCellReuseIdentifier: FlexHomeEloTableFooterButtonCell.reuseIdentifier)
        
        return tableView
    }()
    
    
    override func initialize() {
        
        addSubview(topView)
        topView.addSubview(collectionView)
        addSubview(mainView)
        mainView.addSubview(tablewView)
    }
    override func installConstraints() {
  
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(115)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
        tablewView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
