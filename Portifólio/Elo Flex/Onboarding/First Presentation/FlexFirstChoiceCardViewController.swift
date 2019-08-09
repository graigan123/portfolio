//
//  FlexFirstChoiceCardViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexFirstChoiceCardViewController: UIViewController {
    
    lazy var choiceView: FlexFirstAddCardView = {
        let view = FlexFirstAddCardView()
        view.bind(mainText: "Escolha seu Cartão Elo", subText: "Temos diversos benefícios adicionados ao seu Cartão Elo, aproveite!", imageName: "Group2blackCard", buttonTitle: "Escolher Cartão")
        view.button.addTarget(self, action: #selector(FlexFirstChoiceCardViewController.handlerChoice(_:)), for: .touchUpInside)
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
        self.view = choiceView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @objc func handlerChoice(_ sender: CatEloButtonBlack) {
        navigator?.start(destination: .selectYourCard)
    }
}
