//
//  FlexNewBenefitsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexNewBenefitsView: BaseView {
    
    var spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    var segmentControl : UISegmentedControl = {
        let items = ["", ""]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .lightBackgroundColor
        segmentedControl.setWidth(0, forSegmentAt: 0)
        //        segmentedControl.bore
        segmentedControl.tintColor = .eloGreen
        return segmentedControl
    }()
    
    lazy var allBenefitsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        if AppDelegate.isIphoneSE {
            button.titleLabel?.font = UIFont.museo500Font(ofSize: 15)
        } else {
            button.titleLabel?.font = UIFont.museo500Font(ofSize: 17)
        }
        
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Todos", for: .normal)
        return button
    }()
    
    lazy var lifySyleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        if AppDelegate.isIphoneSE {
        
            button.titleLabel?.font = UIFont.museo500Font(ofSize: 15)
        } else {
            button.titleLabel?.font = UIFont.museo500Font(ofSize: 17)
        }
        
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Estilo de vida", for: .normal)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(allBenefitsButton)
        stackView.addArrangedSubview(lifySyleButton)
        stackView.isBaselineRelativeArrangement = true
        stackView.spacing = 0
        return stackView
    }()
    
    var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func initialize() {
        addSubview(spaceView)
        spaceView.addSubview(topView)
        topView.addSubview(buttonsStackView)
        topView.addSubview(segmentControl)
        
        spaceView.addSubview(mainView)
    }
    override func installConstraints() {
        
        spaceView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }
        buttonsStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(buttonsStackView.snp.bottom).inset(2)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(1)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

    }
}
