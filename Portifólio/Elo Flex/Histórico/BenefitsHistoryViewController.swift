//
//  BenefitsHistoryViewController.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class BenefitsHistoryViewController: UIViewController {

    fileprivate let collectionViewCellWidth: CGFloat = {
        let value = UIScreen.main.bounds.width * 0.517
        return value
    }()
    
    fileprivate let collectionViewCellHeight: CGFloat = 118.5
    
    lazy var historyView: BenefitsHistoryView = {
        let view = BenefitsHistoryView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.tableView.delegate = self
        view.tableView.dataSource = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            nav.resetTitlePosition()
        }
        title = "Histórico"
    }
 
    fileprivate func transform(cell: UICollectionViewCell) {
        let coverFrame = cell.convert(cell.bounds, to: view)
        
        let transformOffsetX = historyView.collectionView.bounds.width/2 // Point at which transform should be complete
        
        let percent = (0...1).clamp(abs(coverFrame.midX - transformOffsetX) / abs(historyView.collectionView.bounds.width-transformOffsetX))
        
        let maxScaleDifference: CGFloat = 0.15
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1-scale, y: 1-scale)
    }
    
    fileprivate func moveBannerPage(to index: IndexPath, animated: Bool = true) {
        historyView.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        
        //        viewModel.didSelectCreditCard(at: index)
    }

}
extension BenefitsHistoryViewController: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        historyView.collectionView.visibleCells.forEach { transform(cell: $0) }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            return
        }
        let closestCell = collectionView.getClosestVisibleCell()
        if let indexPath = collectionView.indexPath(for: closestCell) {
            moveBannerPage(to: indexPath)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            guard let collectionView = scrollView as? UICollectionView else {
                return
            }
            let closestCell = collectionView.getClosestVisibleCell()
            if let indexPath = collectionView.indexPath(for: closestCell) {
                moveBannerPage(to: indexPath)
            }
        }
    }
}

extension BenefitsHistoryViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4//viewModel.getCreditCardsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCardCollectionViewCell.identifier,
                                                            for: indexPath) as? CreditCardCollectionViewCell else {
                                                                fatalError()
        }
        transform(cell: cell)
        
        //        if let object = viewModel.getCreditCard(at: indexPath) {
        //            cell.configure(with: object)
        //        }
        
        return cell
    }
}

extension BenefitsHistoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = collectionViewCellWidth
        let sideInset = (view.frame.width - cellWidth) / 2
        return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
}

extension BenefitsHistoryViewController: UITableViewDelegate{
    
}

extension BenefitsHistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitsHistoryTableViewCell.identifier, for: indexPath) as! BenefitsHistoryTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    
}
