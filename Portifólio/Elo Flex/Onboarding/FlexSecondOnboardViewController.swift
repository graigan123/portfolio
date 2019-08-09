//
//  FlexSecondOnboardViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexSecondOnboardViewController: UIViewController {
    
    lazy var secondOnboardView: FlexOnboardingView = {
        let view = FlexOnboardingView()
        view.imageView.image = UIImage(named: "Grouppranche")
        view.mainLabel.text = "Os benefícios são sugeridos de acordo com seu perfil"
        view.subLabel.text = "Selecione assustos do seu interesse, e contrate serviços que podem te ajudar no dia-a-dia."
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = secondOnboardView
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
