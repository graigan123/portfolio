//
//  FlexHomeDetailsBannerCollectionCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexHomeDetailsBannerCollectionCell: UICollectionViewCell {
    static let reusableIdentifier = "FlexHomeDetailsBannerCollectionCell"
    
    lazy var spaceView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var titleBanner: UILabel = {
        let label = UILabel.paragraph(size: .large)
        label.textColor = UIColor.white
        label.text = "Elo Automóvel"
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spaceView)
        spaceView.addSubview(cardImageView)
        addSubview(titleBanner)
        
        spaceView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        setupCardImageView()
        setupCardNumberLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardImageView.clipsToBounds = true
        cardImageView.layer.cornerRadius = 4.0
        
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func setupCardImageView() {
        cardImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    func setupCardNumberLabel() {
        titleBanner.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }
    func bind(countCell: Int) {
        
        var image = UIImage()
        
        image = ((countCell % 2 == 0) ? UIImage(named: "carImage")! : UIImage(named: "caroffer"))!
        
        self.cardImageView.image = image
    }
}
