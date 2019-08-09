//
//  BenefitOfferCollectionViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitOfferCollectionViewCell: UICollectionViewCell {
    static let identifier = "BenefitOfferCollectionViewCell"
    
    private lazy var offerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
//    var dateLabel: UILabel = {
//        let label = UILabel.details()
//        label.text = "Vigência 15/05/2019"
//        return label
//    }()
    
    var offerName: UILabel = {
        let label = UILabel.header(size: .small)
        label.textColor = .white
        label.text = "Guincho 24h"
        label.numberOfLines = 0
        return label
    }()
    
//    var addButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Acionar", for: .normal)
//        button.titleLabel?.font = UIFont.museo500Font(ofSize: 10)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 10
//        return button
//    }()
    
    var isSelectedOn: Bool = false
    
    var selectedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Groupdaccord")
        imageView.isHidden = true
        return imageView
    }()
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardImageView()
        setupCardNumberLabel()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        offerImageView.clipsToBounds = true
        offerImageView.layer.cornerRadius = 4.0
        
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    // MARK: Functions
    private func setupCardImageView() {
        addSubview(offerImageView)
        addSubview(offerName)
        addSubview(selectedIcon)
//        addSubview(addButton)
//        addSubview(dateLabel)
        
//        dateLabel.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
//            make.leading.equalToSuperview()
//        }
        
        offerImageView.image = UIImage(named: "caroffer")
        offerImageView.snp.makeConstraints { make in
//            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.edges.equalToSuperview()
        }
        
        offerName.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(20)
        }
        
        selectedIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(16)
            $0.width.equalTo(16)
        }
        
//        addButton.snp.makeConstraints { (make) in
//            make.trailing.equalToSuperview().inset(5)
//            make.width.equalTo(78)
//            make.height.equalTo(22)
//            make.centerY.equalTo(offerName)
////            make.bottom.equalToSuperview().inset(10)
//        }
    }
    
    private func setupCardNumberLabel() {
        addSubview(cardNumberLabel)
        cardNumberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    func configure(with creditCard: CreditCard) {
        self.cardNumberLabel.text = "**** \(creditCard.last4)"
        
        if let url = creditCard.metadata?.image.url {
            self.offerImageView.kf.indicatorType = .activity
            self.offerImageView.kf.setImage(with: url)
        }
    }
    
    func isSelectorOn() {
        if self.isSelectedOn {
            self.layer.masksToBounds = true
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 4.0
            self.layer.borderColor = UIColor.eloGreen.cgColor
            self.selectedIcon.isHidden = false
        } else {
            self.layer.masksToBounds = true
            self.layer.borderColor = UIColor.clear.cgColor
            self.selectedIcon.isHidden = true
        }
    }
    
}
