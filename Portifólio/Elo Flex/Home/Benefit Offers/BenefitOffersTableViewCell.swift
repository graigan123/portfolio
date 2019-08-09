//
//  BenefitOffersTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitOffersTableViewCell: UITableViewCell {

    static let identifier = "BenefitOffersCell"
    
    
    var benefitName: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.textColor = .black
        label.text = "Beneficio"
        return label
    }()
    
    lazy var collectionController: BenefitCollectionViewController = {
        let benefitCollection = BenefitCollectionViewController()
        return benefitCollection
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
        
        
        benefitName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }

        contentView.addSubview((collectionController.view)!)
        
        let collectionControllerView = collectionController.view!
        collectionControllerView.translatesAutoresizingMaskIntoConstraints = false
        collectionControllerView.snp.makeConstraints({ (make) in
      
            make.top.equalTo(benefitName.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(250)
            make.bottom.equalToSuperview()
        })
        
    }

}
