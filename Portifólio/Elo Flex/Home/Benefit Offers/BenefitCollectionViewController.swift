//
//  BenefitCollectionViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitCollectionViewController: UIViewController {

    fileprivate let collectionViewCellWidth: CGFloat = {
        let value = CGFloat(integerLiteral: 175)
        return value
    }()
    
    fileprivate let collectionViewCellHeight: CGFloat = 170
    
    lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.backgroundColor = .white
        return layoutView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(BenefitOfferCollectionViewCell.self, forCellWithReuseIdentifier: BenefitOfferCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundView = layoutView
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()

            make.height.equalTo(170)
            make.top.equalToSuperview()

        }
    }
}
extension BenefitCollectionViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitOfferCollectionViewCell.identifier,
                                                            for: indexPath) as? BenefitOfferCollectionViewCell else {
                                                                fatalError()
        }
        
        return cell
    }
}

extension BenefitCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = collectionViewCellWidth
        let sideInset = (view.frame.width - cellWidth) / 2
        return UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
    }
}
