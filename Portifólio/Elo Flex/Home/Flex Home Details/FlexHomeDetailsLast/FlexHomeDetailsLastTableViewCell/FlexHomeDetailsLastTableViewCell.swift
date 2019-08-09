//
//  FlexHomeDetailsLastTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsLastTableViewCell: UITableViewCell {
    
    static let reusableIdentifier = "FlexHomeDetailsLastTableViewCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var detailsLabel: UILabel = {
        let label = UILabel.paragraph(size: .small)
        label.numberOfLines = 0
        return label
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
        spaceView.addSubview(iconImageView)
        spaceView.addSubview(detailsLabel)
        
        spaceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        detailsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func bind(iconName: String, description: String) {
        let image = UIImage(named: iconName)
        self.iconImageView.image = image!
        self.detailsLabel.text = description
    }
    
}
