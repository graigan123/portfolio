//
//  FlexChangeBenefitsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexChangeBenefitsViewController: UIViewController {
    
    lazy var changeView: FlexChangeBenefitsView = {
        let view = FlexChangeBenefitsView()
        view.ownBenefitsCollectionView.delegate = self
        view.ownBenefitsCollectionView.dataSource = self
        
        view.newBenefitsCollectionView.delegate = self
        view.newBenefitsCollectionView.dataSource = self
        
        return view
    }()
    
    
    override func loadView() {
        super.loadView()
        self.view = changeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            // nav.addImageToTitle(navItem: navigationItem)
            nav.addFlexImageToTitle(navItem: navigationItem)
        }
        self.navigationController?.navigationBar.subviews[2].clipsToBounds = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    fileprivate func transform(cell: UICollectionViewCell) {
        let coverFrame = cell.convert(cell.bounds, to: view)
        
        let transformOffsetX = self.changeView.ownBenefitsCollectionView.bounds.width/2 // Point at which transform should be complete
        
        let percent = (0...1).clamp(abs(coverFrame.midX - transformOffsetX) / abs(self.changeView.ownBenefitsCollectionView.bounds.width-transformOffsetX))
        
        let maxScaleDifference: CGFloat = 0.8
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1-scale, y: 1-scale)
    }
    fileprivate func moveBannerPage(to index: IndexPath, animated: Bool = true, isOwn: Bool) {
        if isOwn {
            self.changeView.ownBenefitsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        } else {
            self.changeView.newBenefitsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        }
    }
}

extension FlexChangeBenefitsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard let collectionView = scrollView as? UICollectionView else {
//            return
//        }
//        switch collectionView.tag {
//        case 0:
//            homeView.collectionView.visibleCells.forEach { transform(cell: $0) }
//        default:
//            break
//        }
//    }
//    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            return
        }
        if collectionView == self.changeView.ownBenefitsCollectionView {
            let closestCell = collectionView.getClosestVisibleCell()
            if let indexPath = collectionView.indexPath(for: closestCell) {
                moveBannerPage(to: indexPath, isOwn: true)
            }
        } else {
            let closestCell = collectionView.getClosestVisibleCell()
            if let indexPath = collectionView.indexPath(for: closestCell) {
                moveBannerPage(to: indexPath, isOwn: false)
            }
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if !decelerate {
            
            guard let collectionView = scrollView as? UICollectionView else {
                return
            }
            if collectionView == self.changeView.ownBenefitsCollectionView {
                
                let closestCell = collectionView.getClosestVisibleCell()
                if let indexPath = collectionView.indexPath(for: closestCell) {
                    moveBannerPage(to: indexPath, isOwn: true)
                }
                
            } else {
                let closestCell = collectionView.getClosestVisibleCell()
                if let indexPath = collectionView.indexPath(for: closestCell) {
                    moveBannerPage(to: indexPath, isOwn: false)
                }
            }
            
//            switch collectionView.tag {
//            case 0:
//                let closestCell = collectionView.getClosestVisibleCell()
//                if let indexPath = collectionView.indexPath(for: closestCell) {
//                    moveBannerPage(to: indexPath)
//                }
//            default:
//
//                break
//            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.changeView.ownBenefitsCollectionView {
            return 5
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.changeView.ownBenefitsCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitOfferCollectionViewCell.identifier, for: indexPath) as? BenefitOfferCollectionViewCell else { fatalError() }
//            transform(cell: cell)
            cell.isSelectorOn()
            
            return cell
            
        } else {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlexChangeNewBenefitsCollectionCell.reusableIdentifier, for: indexPath) as? FlexChangeNewBenefitsCollectionCell else { fatalError() }
            
            
            cell.isSelectorOn()
            cell.setLayers()
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.changeView.ownBenefitsCollectionView {
            return CGSize(width: 115.0, height: 100.0)
        } else {
            return CGSize(width: 115.0, height: 360.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.changeView.ownBenefitsCollectionView {
//            let cellWidth = CGRect(x: 0, y: 0, width: 115.0, height: 0.0)
//            let sideInset = (view.frame.width - cellWidth.width) / 2
            return UIEdgeInsets.init(top: 0, left: 50, bottom: 0, right: 50)
        } else {
//            let cellWidth = CGRect(x: 0, y: 0, width: 115.0, height: 0.0)
//            let sideInset = (view.frame.width - cellWidth.width) / 2
//            return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
            return UIEdgeInsets.init(top: 0, left: 50, bottom: 0, right: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.changeView.ownBenefitsCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! BenefitOfferCollectionViewCell
            cell.isSelectedOn = !cell.isSelectedOn
            cell.isSelectorOn()
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! FlexChangeNewBenefitsCollectionCell
            cell.isSelectedOn = !cell.isSelectedOn
            cell.isSelectorOn()
        }
    }
}
