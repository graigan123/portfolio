//
//  FlexHideNavigationView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHideNavigationView: BaseView {
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow")
        button.setImage(image, for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    
    
    override func initialize() {
        backgroundColor = .clear
        addSubview(spaceView)
        spaceView.addSubview(backButton)
    }
    
    override func installConstraints() {
        spaceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
    }
    
}
