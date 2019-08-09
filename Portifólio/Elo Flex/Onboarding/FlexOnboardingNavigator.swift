//
//  FlexOnboardingNavigator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexOnboardingNavigator: Navigator {
    enum Destination {
        case home, firstAddCard, login
    }
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigate(to destination: FlexOnboardingNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showAlert(alert: FlexOnboardingNavigator.Destination){
        let viewController = makeViewController(for: alert)
        navigationController?.present(viewController, animated: true)
    }
    func start(destination: FlexOnboardingNavigator.Destination) {
        
        if destination == .login {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                appDelegate.startTest()
            }
        }
        
        
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
        case .home:
            navigationController?.dismiss(animated: true, completion: nil)
            let vc = EloFlexHomeViewController()
            return vc
        case .firstAddCard:
            navigationController?.dismiss(animated: true, completion: nil)
            let vc = FlexFirstAddCardViewController(navigator: FlexFirstAddCardNavigator(navigationController: navigationController!))
            return vc
        case .login:
            navigationController?.dismiss(animated: true, completion: nil)
            let viewModel = CatSignInViewModel()
            let vc = CatSignInViewController(viewModel: viewModel)
            return vc
        }
    }
    
    
}
