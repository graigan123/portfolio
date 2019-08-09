//
//  SelectCardCollectionViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit



class SelectCardCollectionViewController: UIViewController {

    private let reuseIdentifier = "SelectCardCell"
    
    fileprivate let collectionViewCellWidth: CGFloat = {
        let value = UIScreen.main.bounds.width * 0.517
        return value
    }()
    
    fileprivate let collectionViewCellHeight: CGFloat = 118.5
    
    lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.backgroundColor = .purple
        return layoutView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(CreditCardCollectionViewCell.self, forCellWithReuseIdentifier: CreditCardCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.lightBackground
        
        
        return collectionView
    }()
    
    override func loadView() {
        super.loadView()
        
        setupCollectionView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()
        
        self.view.backgroundColor = .green
    }

    fileprivate func transform(cell: UICollectionViewCell) {
        let coverFrame = cell.convert(cell.bounds, to: view)
        
        let transformOffsetX = collectionView.bounds.width/2
        
        let percent = (0...1).clamp(abs(coverFrame.midX - transformOffsetX) / abs(collectionView.bounds.width-transformOffsetX))
        
        let maxScaleDifference: CGFloat = 0.15
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1-scale, y: 1-scale)
    }
    
    fileprivate func moveBannerPage(to index: IndexPath, animated: Bool = true) {
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animated)
        
    }

    fileprivate func setupCollectionView() {
        collectionView.backgroundView = layoutView
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            if AppDelegate.isIphoneSE {
                make.height.equalTo(160)
            } else {
                make.height.equalTo(200)
            }
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(view.snp.top)
            }
        }
    }

}
extension SelectCardCollectionViewController: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.visibleCells.forEach { transform(cell: $0) }
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

extension SelectCardCollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCardCollectionViewCell.identifier,
                                                            for: indexPath) as? CreditCardCollectionViewCell else {
                                                                fatalError()
        }
        transform(cell: cell)
        
        cell.temporyConfigure(with: "000\(indexPath.item)")
        
        return cell
    }
}

extension SelectCardCollectionViewController: UICollectionViewDelegateFlowLayout {
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
