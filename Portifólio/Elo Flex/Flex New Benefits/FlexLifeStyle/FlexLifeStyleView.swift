//
//  FlexLifeStyleView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexLifeSyleView: BaseView {
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        
        collectionView.register(FlexLifeStyleCell.self, forCellWithReuseIdentifier: FlexLifeStyleCell.reusebleIdentifier)
        
        return collectionView
    }()
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(collectionView)
    }
    override func installConstraints() {
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
