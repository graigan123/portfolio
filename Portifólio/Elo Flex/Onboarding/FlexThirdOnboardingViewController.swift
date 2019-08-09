//
//  FlexThirdOnboardingViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexThirdOnboardingViewController: UIViewController {
    
    lazy var thirdOnboardView: FlexOnboardingView = {
        let view = FlexOnboardingView()
        view.imageView.image = UIImage(named: "Group2hand")
        view.mainLabel.text = "Acionamento rápido e fácil"
        view.subLabel.text = "Com Elo você aciona seus benefícios de forma rápida e prática."
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = thirdOnboardView
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
