//
//  EloFlexBenefitsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class EloFlexBenefitsViewController: UIViewController {

    let eloFlexView: EloFlexBenefitsView = {
        let view = EloFlexBenefitsView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = eloFlexView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            nav.resetTitlePosition()
        }
        title = "Escolher Bnefícios"
    }

}
