//
//  FlexPopupViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 23/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation


class FlexPopupViewController: UIViewController {
    
    lazy var popupView: FlexPopupView = {
        let view = FlexPopupView()
        view.closeButton.addTarget(self, action: #selector(FlexPopupViewController.closedModal(_:)), for: .touchUpInside)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func closedModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
