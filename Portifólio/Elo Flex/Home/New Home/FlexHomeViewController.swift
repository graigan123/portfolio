//
//  FlexHomeViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 22/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol FlexTinderProtocol {
    func startAction(index: Int)
}

class FlexHomeViewController: UIViewController {
    lazy var homeView: FlexHomeView = {
        let view = FlexHomeView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.collectionView.contentInsetAdjustmentBehavior = .always
        
        view.tablewView.delegate = self
        view.tablewView.dataSource = self
        view.tablewView.separatorStyle = .none
        
        return view
    }()
    
    private(set) var navigator: FlexHomeNavigator?
    private var viewModel: FlexHomeProtocol
    
    
    private var internalTopScroll: Bool = false
    
    // MARK: Life Cycle
    init(viewModel: FlexHomeProtocol = FlexHomeViewModel(), navigator: FlexHomeNavigator? = nil) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        if let nav = navigationController as? CatEloNavigationController{
            nav.addRightButtonItem(navItem: navigationItem)
            nav.addFlexImageToTitle(navItem: navigationItem)
        }
        self.navigationController?.navigationBar.subviews[2].clipsToBounds = false
        
        self.navigator = FlexHomeNavigator(navigationController: self.navigationController!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    fileprivate func transform(cell: UICollectionViewCell, index: IndexPath) {
        let coverFrame = cell.convert(cell.bounds, to: view)
        
        let transformOffsetX = homeView.collectionView.bounds.width/2
        
        let percent = (0...1).clamp(abs(coverFrame.midX - transformOffsetX) / abs(homeView.collectionView.bounds.width-transformOffsetX))
        
        let maxScaleDifference: CGFloat = 0.8
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1-scale, y: 1-scale)
    }
    
    fileprivate func moveBannerPage(to index: IndexPath, animated: Bool = true) {
        homeView.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        guard let cell = homeView.collectionView.cellForItem(at: index) as? CreditCardCollectionViewCell else { return }
    }
    
    @objc func tinderAction(_ sender: UIButton) {
        let closestCell = self.homeView.collectionView.getClosestVisibleCell()
        if let indexPath = self.homeView.collectionView.indexPath(for: closestCell) {
            self.navigator?.navigation(to: .details, bannerIndex: indexPath.item)
        }
    }
    
    func handlerBeneficChange(dateCell: Int) {
        navigator?.navigation(to: .changeBenefic, bannerIndex: dateCell)
    }
}

extension FlexHomeViewController: FlexTinderProtocol {
    func startAction(index: Int) {
        let closestCell = self.homeView.collectionView.getClosestVisibleCell()
        if let indexPath = self.homeView.collectionView.indexPath(for: closestCell) {
            self.navigator?.navigation(to: .details, bannerIndex: indexPath.item)
        }
    }
}

extension FlexHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            return
        }
        switch collectionView.tag {
        case 0:
            homeView.collectionView.visibleCells.forEach {
                
                
                let indexPath = collectionView.indexPath(for: $0)!
                
                transform(cell: $0, index: indexPath)
            }
        default:
            break
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            return
        }
        switch collectionView.tag {
        case 0:
            let closestCell = collectionView.getClosestVisibleCell()
            if let indexPath = collectionView.indexPath(for: closestCell) {
                
                self.internalTopScroll = !self.internalTopScroll
                
                moveBannerPage(to: indexPath)
            }
            
            
            guard let cell = collectionView.getClosestVisibleCell() as? CreditCardCollectionViewCell else { return }

        default:
            break
        }
        
        
    }
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            guard let collectionView = scrollView as? UICollectionView else {
                return
            }
            switch collectionView.tag {
            case 0:
                let closestCell = collectionView.getClosestVisibleCell()
                if let indexPath = collectionView.indexPath(for: closestCell) {
                    moveBannerPage(to: indexPath)
                }
            default:
                
                break
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        switch collectionView.tag {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return 4
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCardCollectionViewCell.identifier,
                                                                for: indexPath) as? CreditCardCollectionViewCell else {
                                                                    fatalError()
            }
            transform(cell: cell, index: indexPath)
            
            cell.temporyConfigure(with: "000\(indexPath.item)")
            
            return cell
            
        
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenefitOfferCollectionViewCell.identifier,
                                                                for: indexPath) as? BenefitOfferCollectionViewCell else {
                                                                    fatalError()
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 110.0, height: 80.0)
        case 1:
            return CGSize(width: 130.0, height: 125.0)
        default:
            return CGSize(width: 110.0, height: 80.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView.tag {
        case 0:
            let cellWidth = CGRect(x: 0, y: 0, width: 110.0, height: 0.0)
            let sideInset = (view.frame.width - cellWidth.width) / 2
            return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
        case 1:
            let cellWidth = CGRect(x: 0, y: 0, width: 120.0, height: 0.0)
            let sideInset = (view.frame.width - cellWidth.width) / 2
            return UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
        default:
            let cellWidth = CGRect(x: 0, y: 0, width: 110.0, height: 0.0)
            let sideInset = (view.frame.width - cellWidth.width) / 2
            return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 1:
            
            let cell = collectionView.cellForItem(at: indexPath) as! BenefitOfferCollectionViewCell
            self.handlerBeneficChange(dateCell: indexPath.item)
        default:
            return
        }
        
    }
    
    
    @objc func handler(_ sender: CatEloButtonBlack) {
        
    }
    
}

extension FlexHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexCardAnimatedCell.reuseIdentifier, for: indexPath) as! FlexCardAnimatedCell
            cell.selectionStyle = .none
            cell.bind(countCard: 10)
            cell.cardAnimated.delegate = self
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeEloCardCollectionCell.reuseIdentifier, for: indexPath) as! FlexHomeEloCardCollectionCell
            cell.selectionStyle = .none
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeEloTableFooterButtonCell.reuseIdentifier, for: indexPath) as! FlexHomeEloTableFooterButtonCell
            cell.contView.backgroundColor = .white
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 360.0
        case 1:
            return 250.0
            
        case 2:
            return 120.0
        default:
            return 0.0
        }
    }
}
