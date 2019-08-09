//
//  FlexChangeNewBenefitsCollectionCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexChangeNewBenefitsCollectionCell: UICollectionViewCell {
    
    static let reusableIdentifier: String = "FlexChangeNewBenefitsCollectionCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.0
        return view
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carImage")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4.0
        return imageView
    }()
    
    
    var topLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.eloGreen.cgColor
        return layer
    }()
    var leftLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.eloGreen.cgColor
        return layer
    }()
    var rightLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.eloGreen.cgColor
        return layer
    }()
    
//    var topLayer: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.eloGreen
//        return view
//    }()
    
    
    var descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.greyBackgroundColor
        view.layer.borderColor = UIColor.eloGray.cgColor
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 4.0

        
        
        view.layer.cornerRadius = 4.0
        
        return view
    }()
    var newBenefitsDescriptionLabel: UILabel = {
        let label = UILabel()//.paragraph(size: .small)
        
        if AppDelegate.isIphoneSE{
            label.font = UIFont(name: "Museo-500", size: 9) ?? .boldSystemFont(ofSize: 9)
        }else{
            label.font = UIFont(name: "Museo-500", size: 11) ?? .boldSystemFont(ofSize: 11)
        }
        
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Segurança para a sua bike!")
//            .bold("bike!")
        label.attributedText = formattedString
        label.numberOfLines = 0
        
        label.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.35, alpha: 1)
        
        return label
    }()
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white//UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1)
        
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.1
        view.layer.borderColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1).cgColor
        
        return view
    }()
    
    var knowMoreLabel: UIButton = {
        let button = UIButton()
        button.setTitle("Saiba Mais", for: .normal)
        if AppDelegate.isIphoneSE{
            button.titleLabel?.font = UIFont(name: "Museo-700", size: 9) ?? .boldSystemFont(ofSize: 9)
        }else{
            button.titleLabel?.font = UIFont(name: "Museo-700", size: 11) ?? .boldSystemFont(ofSize: 11)
        }
        
        button.setTitleColor(UIColor(red: 0.36, green: 0.36, blue: 0.35, alpha: 1), for: .normal)
        
        
        
        return button
    }()
    
    var isSelectedOn: Bool = false
    var selectedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Groupdaccord")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
        
        backgroundColor = .white
        
//        self.topLayer.isHidden = !isSelectedOn
        
        self.selectedIcon.isHidden = !isSelectedOn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayers() {
        self.topLayer.frame = CGRect(x: 0.0, y: 0.0, width: 115.0, height: 2)
        self.leftLayer.frame = CGRect(x: 0.0, y: 0.0, width: 2, height: 200.0)
        self.rightLayer.frame = CGRect(x: 113.0, y: 0.0, width: 2, height: 200.0)
        
        self.topLayer.isHidden = true
        self.leftLayer.isHidden = true
        self.rightLayer.isHidden = true
    }
    
    func setupView() {
        addSubview(spaceView)
        spaceView.addSubview(descriptionView)
        spaceView.addSubview(imageView)
//        imageView.addSubview(topLayer)
        imageView.layer.addSublayer(topLayer)
        imageView.layer.addSublayer(leftLayer)
        imageView.layer.addSublayer(rightLayer)
        
        descriptionView.addSubview(newBenefitsDescriptionLabel)
        descriptionView.addSubview(lineView)
        descriptionView.addSubview(knowMoreLabel)
        
        imageView.addSubview(selectedIcon)
        
        spaceView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(260)
//            $0.bottom.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
//        topLayer.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(2)
//        }
        
        selectedIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(6)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        newBenefitsDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(50)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(newBenefitsDescriptionLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(7)
            $0.height.equalTo(1)
        }
        knowMoreLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(20)
//            $0.bottom.equalToSuperview().inset(7)
        }
    }
    
    func isSelectorOn() {
        if self.isSelectedOn {
            
//            let topBorder: CALayer = CALayer()
//            topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.imageView.frame.width, height: 2)
//            topBorder.backgroundColor = UIColor.eloGreen.cgColor
//            self.imageView.layer.addSublayer(topBorder)
            //user isso aqui para fazer a borda do top e lados da image e da descriptionView no bot e nos lados tbm. boa sorte!
            
            self.topLayer.isHidden = false
            self.leftLayer.isHidden = false
            self.rightLayer.isHidden = false
            self.descriptionView.layer.borderColor = UIColor.eloGreen.cgColor
            self.selectedIcon.isHidden = false

        } else {
            self.descriptionView.layer.masksToBounds = true
            self.descriptionView.layer.borderColor = UIColor.eloGray.cgColor
            self.selectedIcon.isHidden = true
            self.topLayer.isHidden = true
            self.leftLayer.isHidden = true
            self.rightLayer.isHidden = true
        }
    }
    
}
