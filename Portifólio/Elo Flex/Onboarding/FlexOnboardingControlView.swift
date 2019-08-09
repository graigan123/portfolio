//
//  FlexOnboardingControlView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexOnboardingControlView: BaseView {
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(.greyTextColor, for: .normal)
        button.titleLabel?.font = .museo500Font(ofSize: 14)
        return button
    }()
    
    let contView: UIView = {
        let view = UIView()
        return view
    }()
    
    let viewPage: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func initialize() {

        addSubview(contView)
        contView.addSubview(viewPage)
        contView.addSubview(pageControl)
        contView.addSubview(skipButton)
    }
    
    override func installConstraints() {
        contView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        viewPage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()//o(pageControl.snp.top).offset(10)
        }
        
        pageControl.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        
        skipButton.snp.makeConstraints {
            $0.centerY.equalTo(pageControl.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
