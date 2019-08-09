//
//  FlexOnboardingView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexOnboardingView: BaseView {
    
    let contView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageView: UIImageView = {
        let imag = UIImageView()
        imag.contentMode = .scaleAspectFit
        return imag
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel.paragraph(size: .large)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel.paragraph(size: .small)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func initialize() {
        addSubview(contView)
        contView.addSubview(imageView)
        contView.addSubview(mainLabel)
        contView.addSubview(subLabel)
    }
    
    override func installConstraints() {
        
        contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
            $0.centerX.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
