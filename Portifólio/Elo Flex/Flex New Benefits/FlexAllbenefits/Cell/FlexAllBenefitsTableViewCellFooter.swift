//
//  FlexAllBenefitsTableViewCellFooter.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexAllBenefitsTableViewCellFooter: UITableViewCell {
    
    static let reusebleIdentifier = "FlexAllBenefitsTableViewCellFooter"
    
    var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        
        if AppDelegate.isIphoneSE {
            button.titleLabel?.font = UIFont(name: "Museo700-Regular", size: 12) ?? .boldSystemFont(ofSize: 12)
        } else {
            button.titleLabel?.font = UIFont(name: "Museo700-Regular", size: 14) ?? .boldSystemFont(ofSize: 14)
        }
        
        button.setTitle("Acionar Benefício", for: .normal)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15.0
        button.backgroundColor = UIColor.eloGreen
        
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
        spaceView.addSubview(button)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(150)
        }
    }
    
}
