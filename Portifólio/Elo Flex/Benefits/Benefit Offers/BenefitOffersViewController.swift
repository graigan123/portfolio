//
//  BenefitOffersViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitOffersViewController: UIViewController {

    lazy var benefitOfferView: BenefitOffersView = {
        let view = BenefitOffersView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
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
        self.view = benefitOfferView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

}

extension BenefitOffersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitOfferTableViewCell.identifier, for: indexPath) as! BenefitOfferTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigator?.navigate(to: .offerDetail)
    }
}


extension BenefitOffersViewController: UITableViewDelegate{
    
}
