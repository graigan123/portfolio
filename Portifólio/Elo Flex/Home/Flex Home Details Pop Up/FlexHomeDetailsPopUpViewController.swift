//
//  FlexHomeDetailsPopUpViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsPopUpViewController: UIViewController {
    
    lazy var popUpView: FlexHomeDetailsPopUpView = {
        let view = FlexHomeDetailsPopUpView()
        view.closeButton.addTarget(self, action: #selector(handlerCloseButton(_:)), for: .touchUpInside)
        return view
    }()
    
    var navigator: FlexHomeNavigator?
    
    init(navigator: FlexHomeNavigator? = nil) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = popUpView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
    }
    
    @objc func handlerCloseButton(_ sender: UIButton) {
        navigator?.dismissModal()
    }
    
}
