//
//  FlexHomeDetailsFooterChangeCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsFooterChangeCell: UITableViewCell {
    
    static var reusableIdentifier = "FlexHomeDetailsFooterChangeCell"
    
    let spaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let actionButton: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Trocar Benefício", for: .normal)
        return button
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
        spaceView.addSubview(actionButton)
        
        spaceView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        actionButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
        }
    }
}
