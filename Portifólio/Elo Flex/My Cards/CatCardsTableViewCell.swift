//
//  CatCardsTableViewCell.swift
//  Elo
//
//  Created by Bruna on 16/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class CatCardsTableViewCell: UITableViewCell {

    static let identifier = "CatCardsTableViewCell"
    
    var cardLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Cartão de Crédito"
        label.numberOfLines = 0
        return label
    }()
    
    var cardNumberLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Elo Nanquim ****5048"
        label.numberOfLines = 0
        return label
    }()
    
    let trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "trash"), for: .normal)
        return button
    }()
    
    let greyLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayText
        return view
    }()
    
    var addCardLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Adicionar Cartão Elo"
        label.numberOfLines = 0
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addBtn"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addCardOnView()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(cardLabel)
        contentView.addSubview(cardNumberLabel)
        contentView.addSubview(trashButton)
        
        cardLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(92)
        }
        
        cardNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(92)
            make.bottom.equalToSuperview().inset(18)
        }
        
        trashButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(25)
            make.width.equalTo(18.5)
        }
        
    }
   

    
//    func bind(card: CatCreditCardModel) {
//
//        self.cardLabel.text = "\(card.networkName ?? "")\n **** \(card.digFour ?? "")"
//        self.addCardLabel.text = "Alterar cartão \(card.networkName ?? "")"
//        self.addButton.setImage(UIImage(named: "editIcon"), for: .normal)
//        addCardOnView()
//    }
    
//    func deleteCardFromView(){
//        whiteView.removeFromSuperview()
//        addCardLabel.removeFromSuperview()
//        addButton.removeFromSuperview()
//        trashButton.removeFromSuperview()
//        greyLine.removeFromSuperview()
//        cardLabel.removeFromSuperview()
//        self.addButton.setImage(UIImage(named: "addBtn"), for: .normal)
//        initialize()
//        installConstraints()
//    }
//
    func addCardOnView(){
        contentView.addSubview(addCardLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(cardLabel)
        contentView.addSubview(trashButton)
        contentView.addSubview(greyLine)

        cardLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(92)
        }
        
        cardNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.trailing.equalToSuperview().inset(92)
            make.bottom.equalToSuperview().inset(10)
        }
        
        trashButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(28)
            make.width.equalTo(8)
        }
    

//        greyLine.snp.makeConstraints { (make) in
//            make.leading.equalToSuperview().inset(Int.marginLeft)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(cardLabel.snp.bottom).offset(25)
//            make.height.equalTo(2)
//        }
//
//        addCardLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(greyLine.snp.bottom).offset(28)
//            make.leading.equalToSuperview().inset(Int.marginLeft)
//            make.trailing.equalToSuperview().inset(92)
//        }
//
//        addButton.snp.makeConstraints { (make) in
//            make.centerY.equalTo(addCardLabel)
//            make.trailing.equalToSuperview().inset(17)
//            make.height.equalTo(25)
//            make.width.equalTo(25)
//        }
    }
    //    let whiteView: UIView = {
    //        let view = UIView()
    //        view.backgroundColor = .white
    //        return view
    //    }()
    //
    //    override func initialize() {
    //        addSubview(whiteView)
    //    }
    //
    //    override func installConstraints() {
    //        whiteView.snp.makeConstraints { (make) in
    //            make.top.equalToSuperview()
    //            make.leading.equalToSuperview().inset(12)
    //            make.trailing.equalToSuperview().inset(12)
    //            make.bottom.equalToSuperview().inset(12)
    //        }
    //    }
}
