//
//  FlexNewBenefitsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexNewBenefitsViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    lazy var vcs = [UIViewController]()
    lazy var orderedViewControllers = [UIViewController]()
    
    
    lazy var benefitsView: FlexNewBenefitsView = {
        let view = FlexNewBenefitsView()
//        view.tableView.delegate = self
//        view.tableView.dataSource = self
        return view
    }()
    
    var allBenefitsViewController: FlexAllBenefitsViewController?
    var lifeStyleViewController: FlexLifeStyleViewController?
    
    override func loadView() {
        super.loadView()
        self.view = benefitsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configPageController() {
        
        self.allBenefitsViewController = FlexAllBenefitsViewController()
        self.allBenefitsViewController?.allBenefitsView.tableView.delegate = self
        self.allBenefitsViewController?.allBenefitsView.tableView.dataSource = self
        
        self.lifeStyleViewController = FlexLifeStyleViewController()
//        self.lifeStyleViewController.lifeStyleView.collectionView.delegate = self
//        self.lifeStyleViewController?.lifeStyleView.collectionView.dataSource = self
//
        
    }
    
}

extension FlexNewBenefitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    

}


