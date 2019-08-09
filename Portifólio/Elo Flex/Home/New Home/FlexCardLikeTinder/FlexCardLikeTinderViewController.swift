//
//  FlexCardLikeTinderViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 30/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit
import SnapKit

class FlexCardLikeTinderViewController: UIViewController {
    
    lazy var tinderView: FlexCardLikeTinderView = {
        
        let view = FlexCardLikeTinderView()
        
        return view
    }()
    
    lazy var animatedView: [FlexAnimatedCardView] = {
        let views = [FlexAnimatedCardView]()
        return views
    }()
    
    var delegate: FlexTinderProtocol?
    
    var countCard: Int
    
    init(count: Int, delegate: FlexTinderProtocol? = nil) {
        self.countCard = count
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.tinderView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind(arrayIndex: countCard)
        self.createPanGestureRecognizer(targetView: animatedView.last!)
        self.createTapGestureRecognizer(targetView: animatedView.last!)
    }
    
    func bind(arrayIndex count: Int) {
        
        self.tinderView.pageControl.numberOfPages = count
        self.tinderView.pageControl.currentPage = count
        
        for range in 0...(count - 1) {
            let view = FlexAnimatedCardView()
            view.image.image = UIImage(named: range % 2 == 0 ? "caroffer" : "carImage")
            view.dateLabel.text = "Vigência 20/06/202\(range)"
            view.tag = range
            self.animatedView.append(view)
        }
        
        self.animatedView.forEach { (view) in
            self.tinderView.mainView.addSubview(view)
            if view.tag != (count - 1) {
                view.snp.makeConstraints {
                    $0.top.equalToSuperview()
                    $0.leading.equalToSuperview()
                    $0.trailing.equalToSuperview()
                    $0.bottom.equalToSuperview()
                }
            } else {
                view.snp.makeConstraints {
                    $0.top.equalToSuperview().inset(10)
                    $0.leading.equalToSuperview().inset(10)
                    $0.trailing.equalToSuperview().offset(10)
                    $0.bottom.equalToSuperview().offset(10)
                }
            }
        }
    }
    
    func createTapGestureRecognizer(targetView: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerTinder))
        targetView.addGestureRecognizer(tapGesture)
    }
    
    func createPanGestureRecognizer(targetView: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action:#selector(handlePanGesture(sender:)))
        targetView.addGestureRecognizer(panGesture)
    }
    
    func swipeDidEnd(view: UIView) {
        
        animatedView.rearrange(from: animatedView.count - 1 , to: 0)
        
        UIView.animate(withDuration: 1.5) { [weak self] in
            guard let self = self else { return }
            self.tinderView.mainView.insertSubview(self.tinderView.mainView.subviews.last!, at: 0)

        }
        
        guard let newView = animatedView.last else {
            self.loadView()
            return
        }
        
        self.createPanGestureRecognizer(targetView: newView)
        self.createTapGestureRecognizer(targetView: newView)
   
        self.tinderView.pageControl.currentPage = newView.tag
        
    }
    
    @objc func handlerTinder() {
        
        self.delegate?.startAction(index: self.tinderView.pageControl.currentPage)
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        let card = sender.view as! FlexAnimatedCardView
        let point = sender.translation(in: self.tinderView.mainView)
        let centerOfParentContainer = CGPoint(x: self.tinderView.mainView.frame.width / 2, y: self.tinderView.mainView.frame.height / 2)
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
        switch sender.state {
        case .ended:
            if (card.center.x) > 200 {
                self.swipeDidEnd(view: card)
                UIView.animate(withDuration: 0.2) {

                    card.center = CGPoint(x: self.tinderView.mainView.frame.width / 2, y: self.tinderView.mainView.frame.height / 2)
                    card.transform = CGAffineTransform(rotationAngle: 0.0)
                    
                    self.loadViewIfNeeded()
                }
                return
            }else if card.center.x < 0 {
                self.swipeDidEnd(view: card)
                UIView.animate(withDuration: 0.2) {

                    card.center = CGPoint(x: self.tinderView.mainView.frame.width / 2, y: self.tinderView.mainView.frame.height / 2)
                    card.transform = CGAffineTransform(rotationAngle: 0.0)
                    
                    self.loadViewIfNeeded()
                }
                return
            }
            UIView.animate(withDuration: 0.2) {
                card.transform = .identity
                card.center = CGPoint(x: self.tinderView.mainView.frame.width / 2, y: self.tinderView.mainView.frame.height / 2)
                self.loadViewIfNeeded()
            }
        case .changed:
            let rotation = tan(point.x / (self.tinderView.mainView.frame.width * 2.0))
            card.transform = CGAffineTransform(rotationAngle: rotation)
            
        default:
            break
        }
    }
}

extension RangeReplaceableCollection where Indices: Equatable {
    mutating func rearrange(from: Index, to: Index) {
        
        if from == to {
            return
        }
        
        precondition(from != to && indices.contains(from) && indices.contains(to), "invalid indices")
        insert(remove(at: from), at: to)
    }
}
