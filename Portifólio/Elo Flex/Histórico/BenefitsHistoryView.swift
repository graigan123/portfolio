//
//  BenefitsHistoryView.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class BenefitsHistoryView: BaseView{
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
        tableView.register(BenefitsHistoryTableViewCell.self, forCellReuseIdentifier: BenefitsHistoryTableViewCell.identifier)
        return tableView
    }()

    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterButton"), for: .normal)
        return button
    }()
    
    override func initialize() {
        addSubview(spaceView)
        addSubview(whiteView)
        whiteView.addSubview(collectionView)
        whiteView.addSubview(tableView)
        whiteView.addSubview(filterButton)
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
        collectionView.backgroundView = layoutView
        collectionView.snp.makeConstraints { make in
        make.leading.equalToSuperview()
        make.trailing.equalToSuperview()
        if AppDelegate.isIphoneSE {
            make.height.equalTo(160)
        } else {
            make.height.equalTo(200)
        }
        if #available(iOS 11.0, *) {
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        } else {
            make.top.equalTo(self.snp.top)
        }
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(17)
            make.trailing.equalToSuperview().inset(19)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
    }
    
}
