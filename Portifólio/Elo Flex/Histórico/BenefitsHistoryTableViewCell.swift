//
//  BenefitsHistoryTableViewCell.swift
//  Elo
//
//  Created by Bruna on 16/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitsHistoryTableViewCell: UITableViewCell {

    static let identifier = "benefitsHistoryCell"
    
    var benefitName: UILabel = {
        let label = UILabel.boldParagraph(size: .medium)
//        label.font = UIFont.museo700Font(ofSize: 15)
        label.textColor = .greyText
        label.text = "Auto"
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = .greyText
        label.text = "05/06/2019 15:50 PM"
        return label
    }()
    
    var offerLabel: UILabel = {
        let label = UILabel.boldParagraph(size: .medium)
//        label.font = UIFont.museo700Font(ofSize: 15)
        label.textColor = .greyText
        label.text = "Acionou Guincho 24h"
        return label
    }()
    var cardLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = .greyText
        label.text = "**** 5550"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(benefitName)
        contentView.addSubview(dateLabel)
        contentView.addSubview(offerLabel)
        contentView.addSubview(cardLabel)
        
        
        benefitName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(benefitName.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
       
        offerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        
        cardLabel.snp.makeConstraints { (make) in
            make.top.equalTo(offerLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.bottom.equalToSuperview().inset(20)
        }
        
    }

}
