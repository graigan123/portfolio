//
//  FlexOnboardingViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

//Grouponboard
//Grouppranche
//Group2hand
//eloLogo

import Foundation

class FlexOnboardingViewController: UIViewController {
    
    lazy var firstOnboardView: FlexOnboardingView = {
        let view = FlexOnboardingView()
        view.imageView.image = UIImage(named: "Grouponboard")
        view.mainLabel.text = "Benefícios exclusivos para clientes Elo!"
        view.subLabel.text = "Só quem é cliente Elo tem benefícios exclusivos para aproveitar a vida com comodidade."
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = firstOnboardView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        if let nav = navigationController as? CatEloNavigationController{
//            nav.addRightButtonItem(navItem: navigationItem)
//            nav.addImageToTitle(navItem: navigationItem)
//        }
//        
//        self.navigationController?.navigationBar.subviews[2].clipsToBounds = false
        
    }
    
}
