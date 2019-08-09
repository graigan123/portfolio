//
//  OfferAcionedDetailsView.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import SnapKit

final class OfferAcionedDetailsView: BaseView{
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
        label.text = "Película Protetora"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(OfferAcionedTableViewCell.self, forCellReuseIdentifier: OfferAcionedTableViewCell.identifier)
        return tableView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    var offerName: UILabel = {
        let label = UILabel.boldParagraph(size: .medium)
        label.textColor = .greyText
        label.numberOfLines = 0
        label.text = "Película Protetora"
        return label
    }()
    var benefitDescription: UILabel = {
        let label = UILabel.paragraph(size: .small)
        label.textColor = .greyText
        label.numberOfLines = 0
        label.text = "Aplicada sobre o couro para proteger e hidratar o banco, evitando rachaduras e ressecamentos."
        return label
    }()
    
    let termsToggleButton: EloToggleButton = {
        let button = EloToggleButton()
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel.details()
        label.text = "Aceito os termos e Condições"
        return label
    }()
    
    let addButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Adicionar Benefício", for: .normal)
        return button
    }()
    
    let noButton: CatEloButton = {
        let button = CatEloButton()
        button.setTitle("Agora não", for: .normal)
        return button
    }()
    
    override func initialize() {
        addSubview(imageBenefit)
        addSubview(scrollView)
        imageBenefit.addSubview(benefitName)
        scrollView.addSubview(offerName)
        scrollView.addSubview(benefitDescription)
        scrollView.addSubview(termsToggleButton)
        scrollView.addSubview(termsLabel)
        scrollView.addSubview(addButton)
        scrollView.addSubview(noButton)
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
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(imageBenefit.snp.bottom)
        
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            
            
            make.bottom.equalToSuperview().inset(12)
        }
        
        offerName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(50)
        }
        
        benefitDescription.snp.makeConstraints { (make) in
            make.top.equalTo(offerName.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.centerX.equalToSuperview()
            //            make.trailing.equalToSuperview().inset(50)
        }
        addButton.snp.makeConstraints { (make) in
            make.top.equalTo(termsToggleButton.snp.bottom).offset(60)
            make.height.equalTo(Int.buttonHeight)
            make.width.equalTo(Int.buttonWidth)
            make.centerX.equalToSuperview()
        }
        
        noButton.snp.makeConstraints { (make) in
            make.top.equalTo(addButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(Int.buttonHeight)
            make.width.equalTo(Int.buttonWidth)
            make.bottom.equalToSuperview().inset(40)
        }
        
        setupToggleButtons()
    }
    
    fileprivate func setupToggleButtons() {
        termsToggleButton.snp.makeConstraints { make in
            make.top.equalTo(benefitDescription.snp.bottom).offset(30)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.leading.equalToSuperview().inset(Int.marginLeft)
        }
        
        termsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(termsToggleButton.snp.centerY)
            make.leading.equalTo(termsToggleButton.snp.trailing)
        }
    }
    
}
