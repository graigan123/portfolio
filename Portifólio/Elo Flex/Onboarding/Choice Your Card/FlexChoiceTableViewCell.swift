//
//  FlexChoiceTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FlexChoiceTableViewCell: UITableViewCell {

    static let identifier = "FlexChoiceTableViewCell"
    
    let contView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
//        view.layer.cornerRadius = 4.0
        view.clipsToBounds = false
//        view.layer.borderWidth = 0.0
//        view.layer.borderColor = UIColor.clear.cgColor
        
        return view
    }()
    let cellView: UIView = {
        let view = UIView()
        
        let cornerLayer = CALayer()
        cornerLayer.cornerRadius = 4.0
        cornerLayer.masksToBounds = true
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.masksToBounds = false
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 4.0
        
        
        
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = true
        
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowPath = shadowLayer.path
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 4.0
        
        view.layer.addSublayer(cornerLayer)
        view.layer.addSublayer(shadowLayer)
        
        
        
//        view.layer.cornerRadius = 5
////        view.clipsToBounds = true
//        view.layer.borderWidth = 0.0
//        view.layer.borderColor = UIColor.clear.cgColor
////
        view.backgroundColor = .white
//        
//        let shadowLayer = view.dropShadow(shadowColor: UIColor.black, fillColor: .white, opacity: 0.2, offset: CGSize(width: 1, height: 1), radius: 4.0)
//        
//        view.layer.addSublayer(shadowLayer)
        
        
        return view
    }()
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eloLogo")
        return image
    }()
    let numberLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "**** **** **** 5454"
        return label
    }()
    let cardLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Elo Nanquim"
        label.textColor = .black
        return label
    }()
    
    
    var circleView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.0
        view.backgroundColor = .white
        return view
    }()
    var clickedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "PathflewCardCheck")
        return imageView
    }()
    
    
    let ownLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Bernardo T. Benincá"
        label.textColor = .black
        return label
    }()
    let validInfoLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = UIColor.flexLightGray
        label.text = "VÁLIDO ATÉ"
        return label
    }()
    let validLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "20/22"
        label.textColor = .black
        return label
    }()
    
    var circleColor = UIColor.red
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        addCardOnView()
        
        self.backgroundColor = .clear
        
//        layer.masksToBounds = false
//        layer.shadowOpacity = 0.1
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowColor = UIColor.black.cgColor
        
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(contView)
        contView.addSubview(cellView)
        cellView.addSubview(logoImage)
        cellView.addSubview(circleView)
        circleView.addSubview(clickedIcon)
        
        cellView.addSubview(numberLabel)
        cellView.addSubview(cardLabel)
        cellView.addSubview(ownLabel)
        cellView.addSubview(validInfoLabel)
        cellView.addSubview(validLabel)
        
        contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()//.inset(4)
            $0.bottom.equalToSuperview().inset(6)
        }
        cellView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(6)
        }
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(55)
            $0.height.equalTo(37)
        }
        numberLabel.snp.makeConstraints {
//            $0.top.equalTo(logoImage.snp.bottom).offset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(24)
            $0.leading.equalToSuperview().inset(15)
        }
        cardLabel.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(15)
//            $0.bottom.equalTo(ownLabel.snp.top).offset(8)
        }
        ownLabel.snp.makeConstraints {
            $0.top.equalTo(cardLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(24)
        }
        validInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(cardLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(15)
        }
        validLabel.snp.makeConstraints {
            $0.centerY.equalTo(ownLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        circleView.snp.makeConstraints {
            $0.centerY.equalTo(logoImage.snp.centerY)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        clickedIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
        
    }
    
    func setupCircle() {
        self.circleView.layer.borderColor = self.circleColor.cgColor
        self.circleView.layer.borderWidth = 1.0
        self.clickedIcon.isHidden = true
        self.circleView.layer.cornerRadius = 24 / 2
    }
    
    func clickedAction() {
        
        self.clickedIcon.isHidden = false
        self.circleView.backgroundColor = self.circleColor
    }
    
    
}
