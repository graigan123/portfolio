//
//  FlexHomeDetailsBannerView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexHomeDetailsBannerView: BaseView {
    
    var spaceView: UIView = {
        let view = UIView()
        return view
    }()
    var pageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .clear
        return pageControl
    }()
    
    var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        
        collectionView.register(FlexHomeDetailsBannerCollectionCell.self, forCellWithReuseIdentifier: FlexHomeDetailsBannerCollectionCell.reusableIdentifier)
        
        collectionView.backgroundColor = .white
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(collectionView)
        addSubview(pageView)
        pageView.addSubview(pageControl)
    }
    
    override func installConstraints() {
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(pageView.snp.top)
        }
        pageView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
