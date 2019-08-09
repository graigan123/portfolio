//
//  FlexLifeStyleCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexLifeStyleCell: UICollectionViewCell {
    
    static let reusebleIdentifier = "FlexLifeStyleCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.0
        return view
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carImage")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4.0
        return imageView
    }()
    //Pathdaccor
    
    var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var imageCheck: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Pathdaccor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    var titleLabel: UILabel = {
        let label = UILabel.header(size: .small)
        label.text = "Bike"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
        
        backgroundColor = .white
        
        //        self.topLayer.isHidden = !isSelectedOn
        
        self.imageCheck.isHidden = true
        
//        self.selectedIcon.isHidden = !isSelectedOn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(spaceView)
        spaceView.addSubview(imageView)
        spaceView.addSubview(circleView)
        circleView.addSubview(imageCheck)
        spaceView.addSubview(titleLabel)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        circleView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
        imageCheck.snp.makeConstraints {
            $0.center.equalTo(circleView.snp.center)
            $0.width.equalTo(10)
            $0.height.equalTo(10)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview().inset(5)
            $0.bottom.equalToSuperview().inset(5)
        }
        
    }
    
    func checked(isChecked: Bool) {
        self.imageCheck.isHidden = isChecked
    }
    
}
