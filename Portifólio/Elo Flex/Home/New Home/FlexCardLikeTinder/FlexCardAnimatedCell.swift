//
//  FlexCardAnimatedCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 30/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexCardAnimatedCell: UITableViewCell {
    
    static let reuseIdentifier: String = "FlexCardAnimatedCell"
    
    weak var contView: UIView?
    
    var cardAnimated: FlexCardLikeTinderViewController!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        guard let contView = self.contView else { return }
        
        addSubview(contView)
        contView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func bind(countCard: Int) {
        
        guard let _ = self.contView else {
            self.cardAnimated = FlexCardLikeTinderViewController(count: countCard)
            self.contView = self.cardAnimated.view
            setupView()
            return
        }
    }
    
}
