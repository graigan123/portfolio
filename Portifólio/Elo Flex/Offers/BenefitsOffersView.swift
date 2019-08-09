//
//  BenefitsOffersView.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class BenefitsOffersView: BaseView{
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func initialize() {
        addSubview(whiteView)
    }
    
    override func installConstraints() {
        whiteView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
    }
}
