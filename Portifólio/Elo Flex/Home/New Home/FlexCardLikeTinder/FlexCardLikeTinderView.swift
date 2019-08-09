//
//  FlexCardLikeTinderView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 30/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexCardLikeTinderView: BaseView {
    
    
    var contView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var mainLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Seu Benefício"
        return label
    }()
    let subLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Você tem ")
            .eloGreen("03 benefícios salvos!\n")
            .normal(" pode ")
            .eloGreen("acioná-los ")
            .normal("quando desejar.")
        
        label.attributedText = formattedString
        label.numberOfLines = 0
        return label
    }()
    
    
    var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .black
        page.backgroundColor = .clear
        page.transform = CGAffineTransform(rotationAngle: (CGFloat(Float.pi)))
        return page
    }()
    
    
    override func initialize() {
        
        addSubview(contView)
        contView.addSubview(mainLabel)
        contView.addSubview(subLabel)
        contView.addSubview(pageControl)
        contView.addSubview(mainView)
    }
    
    override func installConstraints() {
        
        contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        mainView.snp.makeConstraints {
            
            $0.top.equalTo(subLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            
        }
        pageControl.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
}
