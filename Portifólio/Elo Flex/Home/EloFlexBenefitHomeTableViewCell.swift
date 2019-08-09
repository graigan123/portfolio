//
//  EloFlexBenefitHomeTableViewCell.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class EloFlexBenefitHomeTableViewCell: UITableViewCell {

    static let identifier = "EloFlexBenefitHomeCell"
    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "eloLogo"))
        return imageView
    }()
    
    var cardLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.textColor = .black
        label.text = "**** **** **** 6655"
        return label
    }()
    var cardTypeLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = .black
        label.text = "Elo Nanquim"
        return label
    }()
    var nameLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.textColor = .black
        label.text = "Bernardo T. Benincá"
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel.paragraph(size: .medium)
        label.textColor = .black
        label.text = "20/22"
        return label
    }()
    
    var validLabel: UILabel = {
        let label = UILabel.paragraph(size: .verySmall)
        label.textColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1)
        label.text = "VÁLIDO ATÉ"
        label.numberOfLines = 0
        return label
    }()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.backgroundColor = .lightBackground
        contentView.addSubview(backView)
        backView.addSubview(logoImageView)
        backView.addSubview(cardLabel)
        backView.addSubview(cardTypeLabel)
        backView.addSubview(nameLabel)
        backView.addSubview(dateLabel)
        backView.addSubview(validLabel)
        
        backView.snp.makeConstraints { (make) in
            make.height.equalTo(220)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(37)
            make.width.equalTo(55)
            make.leading.equalToSuperview().inset(15)
        }
        
        cardLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalTo(cardTypeLabel.snp.top).inset(23)
        }

        cardTypeLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalTo(nameLabel.snp.top).inset(2)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(20)
        }
        
        validLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardTypeLabel)
            make.trailing.equalToSuperview().inset(15)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.dropShadow()
    }
}
extension UIView{
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 0)
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
}
