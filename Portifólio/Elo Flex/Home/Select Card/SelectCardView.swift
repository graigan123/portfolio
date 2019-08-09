//
//  SelectCardView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class SelectCardView: BaseView {

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
    
    override func initialize() {
        addSubview(collectionView)
    }
    
    override func installConstraints() {
       
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
        
    }
}
