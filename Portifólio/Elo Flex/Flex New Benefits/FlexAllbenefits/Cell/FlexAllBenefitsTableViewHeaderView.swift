//
//  FlexAllBenefitsTableViewHeaderView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexAllBenefitsTableViewHeaderView: BaseView {
    
    var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    var imageViewMain: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8.0
        
        image.image = UIImage(named: "Group2autoIcon")
        
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Elo Automóvel"
        return label
    }()
    var imageStatus: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "arrowDown")!
        
        return image
    }()
    var validitSubLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Vigência: 20/06/2020"
        return label
    }()
    var callLeftSubLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Acionamento: 03/15"
        return label
    }()
    
    var switchButton: UISwitch = {
        let swit = UISwitch()
        swit.isOn = false
        return swit
    }()
    
    var isExpansible: Bool = false
    
    var newImage: Dynamic<Bool> = Dynamic(false)
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(imageViewMain)
        spaceView.addSubview(titleLabel)
        spaceView.addSubview(imageStatus)
        spaceView.addSubview(validitSubLabel)
        spaceView.addSubview(callLeftSubLabel)
        spaceView.addSubview(switchButton)
        addSubview(mainButton)
        
        
        newImage.bind { [weak self] in
            guard let self = self else { return }
            self.turnArrowImage(flag: $0)
        }
    }
    
    override func installConstraints() {
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        imageViewMain.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
            
            $0.width.equalTo(56)
            $0.height.equalTo(56)
            
            $0.bottom.equalToSuperview().inset(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(imageViewMain.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(30)
        }
        imageStatus.snp.makeConstraints {
//            $0.top.equalToSuperview()
            $0.leading.equalTo(titleLabel.snp.trailing).inset(5)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.height.equalTo(15)
            $0.width.equalTo(15)
        }
        
        validitSubLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(imageViewMain.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(30)
        }
        
        callLeftSubLabel.snp.makeConstraints {
            $0.top.equalTo(validitSubLabel.snp.bottom).offset(2)
            $0.leading.equalTo(imageViewMain.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(30)
        }
        
        switchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(30)
            $0.height.equalTo(15)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(70)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    func bind(){
//        planLabel.text = accountCellViewModel.dateFormatted
//        priceLabel.text = accountCellViewModel.price
//        bonusValueLabel.text = accountCellViewModel.bonus
    }
    
    
    func turnArrowImage(flag: Bool){
        if flag {
            imageStatus.image = UIImage(named: "arrowUp")
        }else{
            imageStatus.image = UIImage(named: "arrowDown")
        }
        
    }
}
