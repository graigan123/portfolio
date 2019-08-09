//
//  BenefitOffersView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class BenefitOffersView: BaseView{
    private let imageBenefit: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "carImage")
        return view
    }()
    
    var benefitName: UILabel = {
        let label = UILabel.boldParagraph(size: .large)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Elo Automóvel"
        return label
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.backgroundColor = .white
        return layoutView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(BenefitOfferTableViewCell.self, forCellReuseIdentifier: BenefitOfferTableViewCell.identifier)
        return tableView
    }()
    
    override func initialize() {
        addSubview(imageBenefit)
        addSubview(whiteView)
        whiteView.addSubview(tableView)
        imageBenefit.addSubview(benefitName)
    }
    
    override func installConstraints() {
        imageBenefit.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(UIScreen.main.bounds.height*0.36)
        }
        benefitName.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        whiteView.snp.makeConstraints { (make) in
            make.top.equalTo(imageBenefit.snp.bottom)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    
    }
    
}
