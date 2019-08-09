//
//  FlexAnimatedCardView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 30/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexAnimatedCardView: BaseView {

    var animatedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4.0
        view.layer.masksToBounds = false
        return view
    }()
    var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4.0
        image.layer.masksToBounds = true
        return image
    }()
    var titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Elo Pet"
        label.textColor = .white
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel.header(size: .extraSmall)
        label.text = "Vigência 20/06/2020"
        label.textColor = .white
        return label
    }()
    var limitedLabel: UILabel = {
        let label = UILabel.header(size: .extraSmall)
        label.text = "Acionamentos 03/05"
        label.textColor = .white
        return label
    }()
    var actionTinderButton: UIButton = {
        let button = UIButton()
        if AppDelegate.isIphoneSE {
            button.titleLabel?.font = UIFont.museo700Font(ofSize: 12)
        } else {
            button.titleLabel?.font = UIFont.museo700Font(ofSize: 14)
        }
        button.setTitle("Acionar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white

        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
       
        return button
    }()
    
    override func initialize() {
        addSubview(animatedView)
        animatedView.addSubview(image)
        image.addSubview(titleLabel)
        image.addSubview(dateLabel)
        image.addSubview(limitedLabel)
        image.addSubview(actionTinderButton)
    }
    override func installConstraints() {
        animatedView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        image.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        limitedLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalTo(limitedLabel.snp.top).offset(4)
            $0.leading.equalToSuperview().inset(10)
        }
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(dateLabel.snp.top).offset(4)
            $0.leading.equalToSuperview().inset(10)
        }
        actionTinderButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(80)
            $0.height.equalTo(25)
        }
    }
}
