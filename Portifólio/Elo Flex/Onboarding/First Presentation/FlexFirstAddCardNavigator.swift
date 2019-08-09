//
//  FlexFirstAddCardNavigator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexFirstAddCardNavigator: Navigator {
    
    enum Destination {
        case addYourCard, choiceYourCard, selectYourCard, home
    }
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: FlexFirstAddCardNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start(destination: FlexFirstAddCardNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]//setViewControllers([viewController], animated: true)
        navigationController?.popToRootViewController(animated: false)
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController{
        switch destination {
        case .addYourCard:
//            let model = ComboEloCardViewModel()
//            let vc = CatAddCardsViewController(viewModel: model, navigator: CatCardsNavigator(navigationController: navigationController!))
//            vc.isFirstFlow = true
            
             let vc = FlexChoiceYourCardViewController(navigator: FlexFirstAddCardNavigator(navigationController: navigationController!))
            
            return vc
        case .choiceYourCard:
            let vc = FlexFirstChoiceCardViewController(navigator: FlexFirstAddCardNavigator(navigationController: navigationController!))
            return vc
        case .selectYourCard:
            let vc = FlexChoiceYourCardViewController(navigator: FlexFirstAddCardNavigator(navigationController: navigationController!))
            return vc
            
        case .home:
            let vc = FlexHomeViewController() //aqui vai ser a minha home, ela vai ser a juncao de outras view

//            let vc = BenefitCollectionViewController() //Aqui tem o carrossel da segunda tableviewcell
//            let vc = SelectCardCollectionViewController() //aqui tem o carrossel do topview
            
//            let vc = EloFlexHomeViewController()// view descatada. aqui era como era a home antigamente. //detalhe aqui tem a navigationbar.
            
            
            
            
//            (let vc = EloFlexSelectCardHomeViewController()// descaratada)!!!
//            let vc = TesteeeViewController() //view lixo
            return vc
            
        }
    }
}
