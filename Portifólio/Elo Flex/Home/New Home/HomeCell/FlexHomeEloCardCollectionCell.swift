//
//  FlexHomeEloCardCollectionCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 29/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import UIKit

class FlexHomeEloCardCollectionCell: UITableViewCell {
    
    static let reuseIdentifier: String = "FlexHomeEloCardCollectionCell"
    
    let contView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.28)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.0
        return view
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Você pode trocar!"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let subLabel: UILabel = {
        let label = UILabel.paragraph(size: .small)
        label.text = "Temos outros benefícios que podem te agradar! Faça a troca a qualquer momento."
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BenefitOfferCollectionViewCell.self, forCellWithReuseIdentifier: BenefitOfferCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.tag = 1
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(self.contView)
        self.contView.addSubview(self.mainLabel)
        self.contView.addSubview(self.subLabel)
        self.contView.addSubview(self.collectionView)
        
        self.contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(24)
        }
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(34)
        }
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(180)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
