//
//  EloFlexHomeViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class EloFlexHomeViewController: UIViewController {
    
    fileprivate let collectionViewCellWidth: CGFloat = {
        let value = UIScreen.main.bounds.width * 0.517
        return value
    }()
    
    fileprivate let collectionViewCellHeight: CGFloat = 118.5

    lazy var homeView: EloFlexHomeView = {
        let view = EloFlexHomeView()
        view.button.addTarget(self , action: #selector(showalert), for: .touchUpInside)
        view.tableView.delegate = self
        view.tableView.dataSource = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            nav.addImageToTitle(navItem: navigationItem)
        }
        
        self.navigationController?.navigationBar.subviews[2].clipsToBounds = false
    }
    
    @objc func showalert(){
        let alert = UIAlertController(title: "teste", message: "descricao", preferredStyle: .alert)
        navigationController?.present(alert, animated: true, completion: nil)

    }
}

extension EloFlexHomeViewController: UITableViewDelegate{
    
}

extension EloFlexHomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectCardTableViewCell.identifier, for: indexPath) as! SelectCardTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: BenefitOffersTableViewCell.identifier, for: indexPath) as! BenefitOffersTableViewCell
            cell.selectionStyle = .none
            return cell
        }   
    }
}
