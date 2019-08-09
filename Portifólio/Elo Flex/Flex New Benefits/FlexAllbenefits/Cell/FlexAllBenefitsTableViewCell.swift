//
//  FlexAllBenefitsTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexAllBenefitsTableViewCell: UITableViewCell {
    
    static let reusableIdentifier = "FlexAllBenefitsTableViewCell"
    
    var spaceView: UIView = {
        let view = UIView()
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Socorro 24h"
        return label
    }()
    var changeLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Troca até 20/07/2020"
        return label
    }()
    var leftLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Acionamentos 03/15"
        return label
    }()
    
    var knowMoreButton: UIButton = {
        let button = UIButton()
        
        if AppDelegate.isIphoneSE {
            button.titleLabel?.font = UIFont(name: "Museo500-Regular", size: 10) ?? .boldSystemFont(ofSize: 10)
        } else {
            button.titleLabel?.font = UIFont(name: "Museo500-Regular", size: 12) ?? .boldSystemFont(ofSize: 12)
        }
        button.setTitle("Saiba Mais", for: .normal)
        button.setTitleColor(UIColor.eloGreen, for: .normal)
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(spaceView)
        spaceView.addSubview(titleLabel)
        spaceView.addSubview(changeLabel)
        spaceView.addSubview(leftLabel)
        spaceView.addSubview(knowMoreButton)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(30)
        }
        changeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(20)
        }
        leftLabel.snp.makeConstraints {
            $0.top.equalTo(changeLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(20)
        }
        knowMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(changeLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
    }
    
}
