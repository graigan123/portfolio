//
//  AppDelegate.swift
//  Portifólio
//
//  Created by Diego Azevedo Vasconcelos on 09/08/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit
import IQKeyboardManager
import Sentry
//import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator:Coordinator?
    
    class var isIphoneXOrBigger: Bool {
        // 812.0 on iPhone X, XS.
        // 896.0 on iPhone XS Max, XR.
        return UIScreen.main.bounds.height >= 812
    }
    
    class var isIphoneSE: Bool {
        // 568.0 on iPhone SE.
        return UIScreen.main.bounds.height == 568.0
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .lightBackground
        
        if Defaults.getFirstOpenApp() {
            
            Defaults.saveFirstOpenApp(value: false)
            
            let eloFlexHomeController = FlexOnboardingControlViewController()//EloFlexHomeViewController()
            let navigationController = CatEloNavigationController(rootViewController: eloFlexHomeController)
            navigationController.setViewControllers([eloFlexHomeController], animated: true)
            self.window?.rootViewController = navigationController//eloFlexHomeController//
            window?.makeKeyAndVisible()
            
            
            
        } else {
                        let eloFlexHomeController = CatSignInViewController()//EloFlexHomeViewController()//Colocar esse no final
            
            
            //            let eloFlexHomeController = FlexNewBenefitsViewController()
            
            //            let eloFlexHomeController = FlexAllBenefitsViewController()
            
//            let eloFlexHomeController = FlexLifeStyleViewController()
            
            
            
            
            
            
            
            
            
            
            //            let eloFlexHomeController = FlexHomeViewController()
            
            
            //            let eloFlexHomeController = FlexChoiceYourCardViewController()
            
            
            //            let eloFlexHomeController = FlexChangeBenefitsViewController()
            
            //            let eloFlexHomeController = BenefitCollectionViewController() //Aqui tem o carrossel da segunda tableviewcell
            //            let eloFlexHomeController = SelectCardCollectionViewController() //aqui tem o carrossel do topview
            
            
            
            
            //            let eloFlexHomeController = FlexHomeDetailsLastViewController()
            
            
            //finished
            //            let eloFlexHomeController = FlexCardLikeTinderViewController(count: 2, delegate: nil)
            //            let eloFlexHomeController = FlexHomeDetailsViewController()
            //            let eloFlexHomeController = FlexCardLikeTinderViewController(count: 10)
            //            let eloFlexHomeController = BenefitCollectionViewController() //Aqui tem o carrossel da segunda tableviewcell
            
            
            
            let navigationController = CatEloNavigationController(rootViewController: eloFlexHomeController)
            navigationController.setViewControllers([eloFlexHomeController], animated: true)
            self.window?.rootViewController = navigationController//eloFlexHomeController//
            window?.makeKeyAndVisible()
        }
        
        
        
        do {
            Client.shared = try Client(dsn: "https://17552bc7fa024e399bc5f1904535dcb1@sentry.io/1510687")
            //solano disse que o dsn vai ser https://21628e728fdb43c2b06cb0dd14e1f714@sentry.io/1506262
            //subistituir depois.
            
            try Client.shared?.startCrashHandler()
        } catch let error {
            print("\(error)")
        }
        
        
        return true
    }
    
    func startTest() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .lightBackground
        let eloFlexHomeController = CatSignInViewController()//EloFlexHomeViewController()
        let navigationController = CatEloNavigationController(rootViewController: eloFlexHomeController)
        navigationController.setViewControllers([eloFlexHomeController], animated: true)
        self.window?.rootViewController = navigationController//eloFlexHomeController//
        window?.makeKeyAndVisible()
    }
    
    func startNewFlow(){
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        
        appCoordinator.startWithoutSplash()//start()
    }
    
}

