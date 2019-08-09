//
//  CatAddCardsView.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

final class CatAddCardsView: BaseView{
    
    private let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    var cardLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.text = "Cartão de Crédito Elo Nanquim ****5048"
        label.numberOfLines = 0
        return label
    }()
    
    let trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "trash"), for: .normal)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)//UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .clear
        tableView.register(CatCardsTableViewCell.self, forCellReuseIdentifier: CatCardsTableViewCell.identifier)
        return tableView
    }()
    
    override func initialize() {
        addSubview(spaceView)
        addSubview(whiteView)
        whiteView.addSubview(tableView)
    }
    override func installConstraints() {
        
        spaceView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(15)
            make.trailing.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(spaceView.snp.bottom)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(12)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func bind(card: CatCreditCardModel) {
        
//        self.cardLabel.text = "\(card.networkName ?? "")\n **** \(card.digFour ?? "")"
//        self.addCardLabel.text = "Alterar cartão \(card.networkName ?? "")"
//        self.addButton.setImage(UIImage(named: "editIcon"), for: .normal)
//        addCardOnView()
    }
    
    func deleteCardFromView(){
//        whiteView.removeFromSuperview()
//        addCardLabel.removeFromSuperview()
//        addButton.removeFromSuperview()
//        trashButton.removeFromSuperview()
//        greyLine.removeFromSuperview()
//        cardLabel.removeFromSuperview()
//        self.addButton.setImage(UIImage(named: "addBtn"), for: .normal)
//        initialize()
//        installConstraints()
    }
    

}
