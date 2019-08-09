//
//  EloFlexSelectCardHomeViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class EloFlexSelectCardHomeViewController: UIViewController {

    let transition = TransitionClone()
    
    lazy var homeView: EloFlexBenefitHomeView = {
        let view = EloFlexBenefitHomeView()
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
    }
    
    @objc func didTapCard(){
        let vc = TesteeeViewController()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }

}
extension EloFlexSelectCardHomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        
        return transition
    }
}

extension EloFlexSelectCardHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EloFlexBenefitHomeTableViewCell.identifier, for: indexPath) as! EloFlexBenefitHomeTableViewCell
        cell.backView.dropShadow()
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! EloFlexBenefitHomeTableViewCell
        let frame = view.convert(cell.backView.frame, from: cell.backView)
        transition.startingFrame = CGRect(x: frame.minX + 15, y: frame.minY + 80,
                                          width: 375 / 414 * view.frame.width - 30, height: 408 / 736 * view.frame.height - 30)
        transition.destinationFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: cell.backView.frame.height * view.frame.width / cell.backView.frame.width)
        didTapCard()
    }
}
