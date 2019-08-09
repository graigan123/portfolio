//
//  SelectCardTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class SelectCardTableViewCell: UITableViewCell {

    static let identifier = "SelectCardCell"
    
    var mainLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.font = UIFont.museo700Font(ofSize: 15)
        label.text = "Selecione o Cartão"
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Veja os benefícios disponíveis para cada cartão."
        return label
    }()
    
    var benefitsMainLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.font = UIFont.museo700Font(ofSize: 15)
        label.text = "Seus Benefícios"
        return label
    }()
    var benefitsDescriptionLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.text = "Você pode adicioná-los sempre que precisar"
        return label
    }()
    
    lazy var collectionController: SelectCardCollectionViewController = {
        let benefitCollection = SelectCardCollectionViewController()
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
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(benefitsMainLabel)
        contentView.addSubview(benefitsDescriptionLabel)
        contentView.addSubview((collectionController.view)!)
        
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        let collectionControllerView = collectionController.view!
        collectionControllerView.translatesAutoresizingMaskIntoConstraints = false
        collectionControllerView.snp.makeConstraints({ (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(150)
        })
        
        benefitsMainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collectionController.view.snp.bottom).offset(35)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }

        benefitsDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(benefitsMainLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
}
