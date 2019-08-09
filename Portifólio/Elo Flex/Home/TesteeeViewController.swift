//
//  TesteeeViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class TesteeeViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "alertClose"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().inset(Int.marginLeft)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        view.backgroundColor = .blue
    }
    
    @objc func didTapBackButton(){
        button.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }

}
