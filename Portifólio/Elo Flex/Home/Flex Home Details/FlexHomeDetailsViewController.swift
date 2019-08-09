//
//  FlexHomeDetailsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexHomeDetailsViewController: UIViewController {
    
    lazy var detailsView: FlexHomeDetailsView = {
        let view = FlexHomeDetailsView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        view.tableView.alwaysBounceVertical = false
        
        return view
    }()
    
    let firstStateTopViewHeight: CGFloat = 200.0
    let secondStateTopViewHeight: CGFloat = 100.0
    
    lazy var bannerView: FlexHomeDetailsBannerView = {
        let view = FlexHomeDetailsBannerView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.pageControl.currentPage = 1
        view.pageControl.numberOfPages = 5
        return view
    }()
    
    lazy var backButton: FlexHideNavigationView = {
        let view =  FlexHideNavigationView()
        view.backButton.addTarget(self, action: #selector(handlerBackButton(_:)), for: .touchUpInside)
        return view
    }()
    
    var isChangeFlux: Bool? 
    
    var currentDetailsModel: [(title:String, subtitle: String)] = []
    
    var currentBannerIndex: Int?
    
    var navigator: FlexHomeNavigator?
    
    init(navigator: FlexHomeNavigator? = nil, fututeViewModel: Int? = nil) {
        self.navigator = navigator
        self.currentBannerIndex = fututeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        detailsView.bind(view: self.bannerView)
        self.view = detailsView
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for range in 0...7 {
            currentDetailsModel.append((title: "Title: \(range)", subtitle: "Here will has a text \(range)"))
        }
        
        
        navigationController?.isNavigationBarHidden = true
        detailsView.tableView.reloadData()
        
    }
    
    fileprivate func moveBannerPage(to index: IndexPath, animated: Bool = true) {
        bannerView.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        
        bannerView.pageControl.currentPage = index.item
        
        self.currentBannerIndex = index.item 
        detailsView.tableView.reloadData()
    }
    
    func transformViewHeight(positionScroll y: CGFloat, cell: FlexHomeDetailsBannerCollectionCell) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            let newHeight = self.firstStateTopViewHeight - y
            
            if newHeight >= self.secondStateTopViewHeight {
            
                self.detailsView.topView.snp.updateConstraints {
                    $0.height.equalTo(newHeight)
                }
                
                cell.titleBanner.snp.updateConstraints {
                     $0.bottom.equalToSuperview().inset(8 + (y / 2))
                }
            }
        }
    }
    @objc func handlerBackButton(_ sender: UIButton) {
        navigator?.backToPreviousViewController()
    }
}

extension FlexHomeDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        guard let collectionView = scrollView as? UICollectionView else {
            
            guard let tableView = scrollView as? UITableView else {
                return
            }
            let closestCell = self.bannerView.collectionView.getClosestVisibleCell()
            self.transformViewHeight(positionScroll: scrollView.contentOffset.y, cell: closestCell as! FlexHomeDetailsBannerCollectionCell)
            return
        }
        
        print("CV: ", scrollView.contentOffset)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else {
            
            guard let tableView = scrollView as? UITableView else {
                return
            }
            
            
            
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
            
            guard let tableView = scrollView as? UITableView else {
                return
            }
            
            
            let closestCell = collectionView.getClosestVisibleCell()
            if let indexPath = collectionView.indexPath(for: closestCell) {
                moveBannerPage(to: indexPath)
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        //        return 4//viewModel.getCreditCardsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlexHomeDetailsBannerCollectionCell.reusableIdentifier,
                                                            for: indexPath) as? FlexHomeDetailsBannerCollectionCell else {
                                                                fatalError()
        }
        
        cell.bind(countCell: indexPath.item)
        
        return cell
        
        //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCardCollectionViewCell.identifier,
        //                                                            for: indexPath) as? CreditCardCollectionViewCell else {
        //                                                                fatalError()
        //        }
        //        transform(cell: cell)
        //
        //        cell.temporyConfigure(with: "000\(indexPath.item)")
        //
        //        //        if let object = viewModel.getCreditCard(at: indexPath) {
        //        //            cell.configure(with: object)
        //        //        }
        //
        //        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width - 24.0), height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidth = CGRect(x: 0, y: 0, width: 0.0, height: 0.0)
        let sideInset = (view.frame.width - cellWidth.width) / 2
//        return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        
//        switch collectionView.tag {
//        case 0:
//            let cellWidth = CGRect(x: 0, y: 0, width: 110.0, height: 0.0)
//            let sideInset = (view.frame.width - cellWidth.width) / 2
//            return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
//        case 1:
//            let cellWidth = CGRect(x: 0, y: 0, width: 120.0, height: 0.0)
//            let sideInset = (view.frame.width - cellWidth.width) / 2
//            return UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
//        default:
//            let cellWidth = CGRect(x: 0, y: 0, width: 110.0, height: 0.0)
//            let sideInset = (view.frame.width - cellWidth.width) / 2
//            return UIEdgeInsets.init(top: 0, left: sideInset, bottom: 0, right: sideInset)
//        }
    }
    
    @objc func handlerBenefict(_ sender: UIButton) {
        navigator?.showModaL()
    }
    
    @objc func handlerChangeViewController(_ sender: UIButton) {
        navigator?.start(destination: .changeViewController)
    }
}

extension FlexHomeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (1 + self.currentDetailsModel.count + 1) // sempre vai ter um ("header") mais a quantidade que vem do serviço e mais um  ("footer")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsHeaderCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsHeaderCell
            cell.selectionStyle = .none
//            cell.selectionStyle = .none
            return cell
        case self.currentDetailsModel.count + 1:
            
            if let isTrue = self.isChangeFlux, isTrue {
                let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsFooterChangeCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsFooterChangeCell
                cell.selectionStyle = .none
                cell.actionButton.addTarget(self, action: #selector(handlerChangeViewController(_:)), for: .touchUpInside)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsFooterTableViewCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsFooterTableViewCell
                cell.selectionStyle = .none
                
                cell.actionButton.addTarget(self, action: #selector(handlerBenefict(_:)), for: .touchUpInside)
                
                return cell
            }
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsTableViewCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsTableViewCell
            
//            cell.selectionStyle = .none
            
            cell.bind(title: self.currentDetailsModel[indexPath.row - 1].title + " of segment \(self.currentBannerIndex ?? -1)", subText: self.currentDetailsModel[indexPath.row - 1].subtitle)
            return cell   
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 1...self.currentDetailsModel.count:
            
            if let isTrue = self.isChangeFlux, isTrue {
                navigator?.navigation(to: .changeLastDetails, bannerIndex: self.currentBannerIndex ?? -1)
            } else {
                navigator?.navigation(to: .lastDetails, bannerIndex: self.currentBannerIndex ?? -1)
            }
            
        default:
            break
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == self.currentDetailsModel.count + 1 {
            
            if let isTrue = isChangeFlux, isTrue {
                return 120.0
            } else {
                return 220.0
            }
        }
        return 90.0
    }
}

