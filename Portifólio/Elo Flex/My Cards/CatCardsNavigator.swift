//
//  CatCardsNavigator.swift
//  Elo
//
//  Created by Bruna on 16/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class CatCardsNavigator: Navigator{
    enum Destination {
        case addCard, myCards, removeCard, removeCardAlert, cardSuccessAlert, home, choice
    }
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigate(to destination: CatCardsNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showAlert(alert: CatCardsNavigator.Destination){
        let viewController = makeViewController(for: alert)
        navigationController?.present(viewController, animated: true)
    }
    func start(destination: CatCardsNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]//setViewControllers([viewController], animated: true)
        navigationController?.popToRootViewController(animated: false)
    }
    func backToInitialScreen(withCard: Bool){
        if let vc = navigationController?.viewControllers.first, let presented = vc.presentedViewController {
            presented.dismiss(animated: true, completion: nil)
        }
        if !withCard{
            navigationController?.viewControllers.first?.viewWillAppear(true)
        }
    }

    func backToPreviousViewController(){
        navigationController?.popViewController(animated: true)
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController{
        switch destination {
        case .addCard:
            let addCardVC = ComboEloAddCardViewController(viewModel: ComboEloCardViewModel(), navigator: CatCardsNavigator(navigationController: navigationController!))//(viewModel: ComboEloCardViewModel(), )
            addCardVC.isFirstFlow = true
            return addCardVC
        case .myCards:
            let signUpViewModel = CatSignUpDataViewModel()
            let signUpVC = CatSignUpViewController(viewModel: signUpViewModel)
            return signUpVC
        //            navigationController.pushViewController(signUpVC, animated: true)
        case .removeCard:
            let signUpViewModel = CatSignUpDataViewModel()
            let signUpVC = CatSignUpViewController(viewModel: signUpViewModel)
            return signUpVC
        case .removeCardAlert:
            let cardViewModel = ComboEloCardViewModel()
            let removeCardVC = RemoveCardAlertViewController(viewModel: cardViewModel, navigator: CatCardsNavigator(navigationController: navigationController!))//(viewModel: cardViewModel)
            removeCardVC.providesPresentationContextTransitionStyle = true
            removeCardVC.definesPresentationContext = true
            removeCardVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            removeCardVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            return removeCardVC
        case .cardSuccessAlert:
            let cardViewModel = ComboEloCardViewModel()
            let alertVC = CardSuccessAlertViewController(viewModel: cardViewModel, navigator: CatCardsNavigator(navigationController: navigationController!))//(viewModel: cardViewModel)
            alertVC.providesPresentationContextTransitionStyle = true
            alertVC.definesPresentationContext = true
            alertVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            alertVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            return alertVC
        case .home:
            navigationController?.dismiss(animated: true, completion: nil)
            let vc = EloFlexHomeViewController()
            return vc
            
        case .choice:
            let vc = FlexFirstChoiceCardViewController(navigator: FlexFirstAddCardNavigator(navigationController: navigationController!))
            return vc
        }
    }
}
