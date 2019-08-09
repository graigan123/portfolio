//
//  FlexHomeEloTableFooterButtonCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 30/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeEloTableFooterButtonCell: UITableViewCell {
    
    static let reuseIdentifier: String = "FlexHomeEloTableFooterButtonCell"
    
    var contView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let button: CatEloButtonBlack = {
        let button = CatEloButtonBlack()
        button.setTitle("Adicionar mais cartões", for: .normal)
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
        backgroundColor = .clear
        addSubview(contView)
        contView.addSubview(button)

        contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Int.buttonWidth)
            $0.height.equalTo(Int.buttonHeight)
        }
    }
}
