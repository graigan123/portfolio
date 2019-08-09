//
//  EloFlexBenefitsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation


final class EloFlexBenefitsView: BaseView{
    
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
