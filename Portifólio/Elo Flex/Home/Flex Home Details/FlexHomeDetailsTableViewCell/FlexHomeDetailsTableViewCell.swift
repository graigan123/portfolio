//
//  FlexHomeDetailsTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsTableViewCell: UITableViewCell {
    
    static let reusableIdentifier: String = "FlexHomeDetailsTableViewCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        return label
    }()
    var subLabel: UILabel = {
        let label = UILabel.paragraph(size: .small)
        label.numberOfLines = 2
        return label
    }()
    var imageArrow: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "arrowRight")
        image.image = img
        return image
    }()
    
    var lineView: UIView = {
        let view = UIView()
        return view
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
        spaceView.addSubview(titleLabel)
        spaceView.addSubview(subLabel)
        spaceView.addSubview(imageArrow)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(16)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(1)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(imageArrow.snp.leading).offset(20)
            $0.bottom.equalToSuperview().inset(15)
        }
        imageArrow.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(13)
            $0.width.equalTo(13)
        }
    }
    
    func bind(title: String, subText: String) {
        self.titleLabel.text = title
        self.subLabel.text = subText
    }
}
