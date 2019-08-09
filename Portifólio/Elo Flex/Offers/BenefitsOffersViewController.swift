//
//  BenefitsOffersViewController.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitsOffersViewController: UIViewController {

    let benefitView: BenefitsOffersView = {
        let view = BenefitsOffersView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = benefitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            nav.resetTitlePosition()
        }
    }


}
