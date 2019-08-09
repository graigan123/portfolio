//
//  BenefitOfferTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitOfferTableViewCell: UITableViewCell {

    static let identifier = "benefitOfferCell"
    
    var offerName: UILabel = {
        let label = UILabel.boldParagraph(size: .medium)
        
        label.textColor = .greyText
        label.numberOfLines = 0
        label.text = "Combustível de emergência 24h"
        return label
    }()
    var benefitDescription: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = .greyText
        label.numberOfLines = 0
        label.text = "Curabitur aliquet arcu non lectus aliquet molestie id quis nibh."
        return label
    }()
    
    let arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrowRight"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(offerName)
        contentView.addSubview(benefitDescription)
        contentView.addSubview(arrowImage)
        
        offerName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(50)
        }
        
        benefitDescription.snp.makeConstraints { (make) in
            make.top.equalTo(offerName.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(13)
        }
        
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(-Int.marginRight)
            make.height.equalTo(16)
        }
    
    }

}
