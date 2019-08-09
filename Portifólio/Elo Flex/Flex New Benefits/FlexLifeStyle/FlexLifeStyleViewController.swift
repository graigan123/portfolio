//
//  FlexLifeStyleViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexLifeStyleViewController: UIViewController {
    
    lazy var lifeStyleView: FlexLifeSyleView = {
        let view = FlexLifeSyleView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = lifeStyleView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension FlexLifeStyleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlexLifeStyleCell.reusebleIdentifier, for: indexPath) as? FlexLifeStyleCell else { fatalError() }
        //            transform(cell: cell)
//        cell.isSelectorOn()
        
        cell.checked(isChecked: false)
        
        
        return cell
        
        
    }
    
}
