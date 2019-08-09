//
//  BenefitOffersNavigator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//
import Foundation

class BenefitOffersNavigator: Navigator {
    enum Destination {
        case offerDetail, addBenefit
    }
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigate(to destination: BenefitOffersNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start(destination: BenefitOffersNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]
        navigationController?.popToRootViewController(animated: false)
    }
    
    func back(){
        navigationController?.popViewController(animated: true)
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController{
        switch destination {
        case .offerDetail:
            print("login")
            let vc = OfferDetailViewController(navigator: BenefitOffersNavigator(navigationController: navigationController!))
            return vc
        case .addBenefit:
            let signUpViewModel = CatSignUpDataViewModel()
            let signUpVC = CatSignUpViewController(viewModel: signUpViewModel)
            return signUpVC

        }
    }
}
