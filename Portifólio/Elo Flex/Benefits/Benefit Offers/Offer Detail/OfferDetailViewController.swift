//
//  OfferDetailViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {

    lazy var offerView: OfferDetailView = {
        let view = OfferDetailView()
        view.noButton.addTarget(self, action: #selector(didTapNoButton), for: .touchUpInside)
        view.scrollView.delegate = self
        return view
    }()
    
    let navigator: BenefitOffersNavigator?
    
    // MARK: Life Cycle
    init(navigator: BenefitOffersNavigator? = nil) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = offerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapNoButton(){
        navigator?.back()
    }
}

extension OfferDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}
