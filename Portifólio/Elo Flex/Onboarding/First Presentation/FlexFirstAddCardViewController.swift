//
//  FlexFirstAddCardViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexFirstAddCardViewController: UIViewController {
    
    lazy var firstAddCardView: FlexFirstAddCardView = {
        let view = FlexFirstAddCardView()
        
//        var newBenefitsDescriptionLabel: UILabel = {
//            let label = UILabel()//.header(size: .small)
//
//            if AppDelegate.isIphoneSE{
//                label.font = UIFont(name: "Museo-700", size: 17) ?? .boldSystemFont(ofSize: 17)
//            }else{
//                label.font = UIFont(name: "Museo-700", size: 19) ?? .boldSystemFont(ofSize: 19)
//            }
//
//            let formattedString = NSMutableAttributedString()
//            formattedString
//                .bold("Adicione seu Cartão Elo ")
//                .normal("para poder ter acesso aos benefícios exclusivos.")
//
//            label.attributedText = formattedString
//            label.numberOfLines = 0
//            return label
//        }()
        
        
        
//        view.bind(mainText: "Adicione seu Cartão Elo", subText: "Adicione seu Cartão Elo para poder ter acesso aos benefícios exclusivos.", imageName: "GroupblueCardPlus", buttonTitle: "Adicionar Cartão")
        
//        view.atributedTextBind(subText: newBenefitsDescriptionLabel.attributedText!)
        
        view.button.addTarget(self, action: #selector(FlexFirstAddCardViewController.handlerAction(_:)), for: .touchUpInside)
        return view
    }()
    
    
    var navigator: FlexFirstAddCardNavigator?
    
    init(navigator: FlexFirstAddCardNavigator? = nil) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.firstAddCardView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func handlerAction(_ sender: CatEloButtonBlack) {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigator?.navigate(to: .addYourCard)
    }
}
