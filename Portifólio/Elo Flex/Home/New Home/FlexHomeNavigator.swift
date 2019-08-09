//
//  FlexHomeNavigator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation


class FlexHomeNavigator: Navigator{
    enum Destination {
        case home, details, lastDetails, popUp, changeBenefic, changeLastDetails, changeViewController
    }
    
    private weak var navigationController: UINavigationController?
    
    private var bannerIndex: Int?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigate(to destination: FlexHomeNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigation(to destination: FlexHomeNavigator.Destination, bannerIndex: Int) {
        self.bannerIndex = bannerIndex
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showAlert(alert: FlexHomeNavigator.Destination){
        let viewController = makeViewController(for: alert)
        navigationController?.present(viewController, animated: true)
    }
    func start(destination: FlexHomeNavigator.Destination) {
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
    
    func navigateModal(to destination: FlexHomeNavigator.Destination) {
        let vc = makeViewController(for: destination)
        navigationController?.topViewController?.present(vc, animated: true, completion: nil)
    }
    
    
    func showModaL() {
        let popupView = makeViewController(for: .popUp)
        popupView.modalTransitionStyle = .crossDissolve
        popupView.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async { [weak self]  in
            guard let self = self else {return}
            self.navigationController?.topViewController?.present(popupView, animated: true, completion: nil)
        }
    }
    func dismissModal() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController{
        switch destination {
        case .home:
            navigationController?.dismiss(animated: true, completion: nil)
            let vc = EloFlexHomeViewController()
            return vc
        case .details:
            let vc = FlexHomeDetailsViewController(navigator: FlexHomeNavigator(navigationController: navigationController!), fututeViewModel: self.bannerIndex)
            return vc
            
        case .lastDetails:
            let vc = FlexHomeDetailsLastViewController(navigator: FlexHomeNavigator(navigationController: navigationController!), fututeViewModel: self.bannerIndex)
            return vc
            
        case .popUp:
            let vc = FlexHomeDetailsPopUpViewController(navigator: FlexHomeNavigator(navigationController: navigationController!))
            return vc
            
        case .changeBenefic:
            let vc = FlexHomeDetailsViewController(navigator: FlexHomeNavigator(navigationController: navigationController!), fututeViewModel: self.bannerIndex)
            vc.isChangeFlux = true
            return vc
            
        case .changeLastDetails:
            let vc = FlexHomeDetailsLastViewController(navigator: FlexHomeNavigator(navigationController: navigationController!), fututeViewModel: self.bannerIndex)
            vc.isChoiceFlux = true
            return vc
        case .changeViewController:
            let vc = FlexChangeBenefitsViewController()
            return vc
        }
    }
}
