//
//  ChooseBenefitsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class ChooseBenefitsViewController: UIViewController {

    let homeView: EloFlexHomeView = {
        let view = EloFlexHomeView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }

}
