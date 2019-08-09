//
//  FlexChangeBenefitsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexChangeBenefitsView: BaseView {
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Trocar Benefícios"
        label.textAlignment = .left
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Você pode ")
            .bold("trocar seus benefícios. ")
            .normal("Siga os passos abaixo.")
        label.attributedText = formattedString
        label.numberOfLines = 0
        return label
    }()
    
    let ownView: UIView = {
        let view = UIView()
        return view
    }()
    let ownDescriptionLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Selecione ")
            .normal("o seu benefício que deseja ")
            .bold("trocar.")
        label.attributedText = formattedString
        label.numberOfLines = 0
        return label
    }()
    var ownBenefitsCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .white
        
        collectionView.register(BenefitOfferCollectionViewCell.self, forCellWithReuseIdentifier: BenefitOfferCollectionViewCell.identifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    
    
    let midView: UIView = {
        let view = UIView()
        return view
    }()
    let lineMidView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    let imageMidView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Group2doubleArrow")
        return imgView
    }()
    
    
    let newBenefitsView: UIView = {
        let view = UIView()
        return view
    }()
    let newBenefitsDescriptionLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Agora ")
            .bold("selecione o benefício ")
            .normal("que mais te ")
            .bold("agrada ")
            .normal("para fazer a ")
            .bold("troca.")
        label.attributedText = formattedString
        label.numberOfLines = 0
        return label
    }()
    var newBenefitsCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .white
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(FlexChangeNewBenefitsCollectionCell.self, forCellWithReuseIdentifier: FlexChangeNewBenefitsCollectionCell.reusableIdentifier)
        
        return collectionView
    }()
    
    
    var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    var actionButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Trocar Benefício", for: .normal)
        button.backgroundColor = UIColor.eloGray
        return button
    }()
    
    let notNowButton: CatEloButton = {
        let button = CatEloButton()
        button.setTitle("Agora Não", for: .normal)
        return button
    }()
    
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(scrollView)
        
        scrollView.addSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(subTitleLabel)
        
        scrollView.addSubview(ownView)
        ownView.addSubview(ownDescriptionLabel)
        ownView.addSubview(ownBenefitsCollectionView)
        
        scrollView.addSubview(midView)
        midView.addSubview(lineMidView)
        midView.addSubview(imageMidView)
        
        scrollView.addSubview(newBenefitsView)
        newBenefitsView.addSubview(newBenefitsDescriptionLabel)
        newBenefitsView.addSubview(newBenefitsCollectionView)
        
        scrollView.addSubview(bottomView)
        bottomView.addSubview(actionButton)
        bottomView.addSubview(notNowButton)
    }
    override func installConstraints() {
        spaceView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(spaceView.snp.trailing)
            $0.height.equalTo(150)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(30)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview()
        }
        
        ownView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(1)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(spaceView.snp.trailing)
            $0.height.equalTo(215)
        }
        ownDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        ownBenefitsCollectionView.snp.makeConstraints {
            $0.top.equalTo(ownDescriptionLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        midView.snp.makeConstraints {
            $0.top.equalTo(ownView.snp.bottom).offset(1)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(spaceView.snp.trailing)
            $0.height.equalTo(30)
        }
        lineMidView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(2)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        imageMidView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        newBenefitsView.snp.makeConstraints {
            $0.top.equalTo(midView.snp.bottom).offset(1)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(spaceView.snp.trailing)
            $0.height.equalTo(360)
        }
        
        newBenefitsDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        newBenefitsCollectionView.snp.makeConstraints {
            $0.top.equalTo(newBenefitsDescriptionLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(newBenefitsView.snp.bottom).inset(80)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(spaceView.snp.trailing)
            $0.height.equalTo(180)
            $0.bottom.equalToSuperview()
        }
        actionButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
        }
        notNowButton.snp.makeConstraints {
            $0.top.equalTo(actionButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
//            $0.bottom.equalToSuperview().inset(30)
            
        }
        
    }
}
