//
//  FlexHomeDetailsHeaderCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsHeaderCell: UITableViewCell {
    
    static let reusableIdentifier: String = "FlexHomeDetailsHeaderCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Virgência: ")
            .bold("20/06/2020")
        label.attributedText = formattedString
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    let countLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Acionamentos: ")
            .bold("03/15")
        label.attributedText = formattedString
        label.numberOfLines = 0
        label.textColor = .darkGray
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
        spaceView.addSubview(dateLabel)
        spaceView.addSubview(countLabel)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        countLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(20)   
        }
    }
}

