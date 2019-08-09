//
//  EloFlexHomeView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class EloFlexHomeView: BaseView{
    
    private let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.backgroundColor = .white
        return layoutView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.register(CreditCardCollectionViewCell.self, forCellWithReuseIdentifier: CreditCardCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.lightBackground
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(BenefitOffersTableViewCell.self, forCellReuseIdentifier: BenefitOffersTableViewCell.identifier)
        tableView.register(SelectCardTableViewCell.self, forCellReuseIdentifier: SelectCardTableViewCell.identifier)
        return tableView
    }()
    
    let button : CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("teste", for: .normal)
        return button
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
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }


}
