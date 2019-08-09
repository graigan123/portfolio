//
//  FlexHideNavigationViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHideNavigationViewController: UINavigationController {
    
    let hideView: FlexHideNavigationView = {
        let view = FlexHideNavigationView()
        return view
    }()
    
    override func loadView() {
        super.loadView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers[0].navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self.navigationController, action: #selector(self.navigationController?.popViewController(animated:)))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    
}
