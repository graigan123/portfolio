//
//  FlexOnboardingControlViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 24/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexOnboardingControlViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    lazy var vcs = [UIViewController]()
    lazy var orderedViewControllers = [UIViewController]()
    
    var firstViewController: FlexOnboardingViewController?
    var secondViewController: FlexSecondOnboardViewController?
    var thirdViewControlelr: FlexThirdOnboardingViewController?
    
//    lazy var pageControll: FlexOnboardingControlView = {
//        let page = FlexOnboardingControlView()
//        page.pageController.numberOfPages = 3
//        page.pageController.currentPage = 0
//
////        self.pageControl.currentPage = 0
////        self.pageControl.tintColor = UIColor.redColor()
////        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
////        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
////
//        return page
//    }()
    
//
    lazy var viewCutom: FlexOnboardingControlView = {
        let page = FlexOnboardingControlView()
        page.pageControl.currentPage = 0
        page.pageControl.numberOfPages = 3
        page.skipButton.addTarget(self, action: #selector(FlexOnboardingControlViewController.handlerSkip(_:)), for: .touchUpInside)
        return page
    }()
    
    var navigator: FlexOnboardingNavigator?
    
    init(navigator: FlexOnboardingNavigator? = nil) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = viewCutom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
//        if let nav = navigationController as? CatEloNavigationController{
//            nav.addRightButtonItem(navItem: navigationItem)
//            nav.addImageToTitle(navItem: navigationItem)
//        }
//        
//        self.navigationController?.navigationBar.subviews[2].clipsToBounds = false
        self.configPageController()
        guard let _ = self.navigator else {
            self.navigator = FlexOnboardingNavigator(navigationController: navigationController!)
            return
        }
    }
    
    func configPageController(){
        self.firstViewController = FlexOnboardingViewController()
        self.secondViewController = FlexSecondOnboardViewController()
        self.thirdViewControlelr = FlexThirdOnboardingViewController()
        
        vcs = [firstViewController] as! [UIViewController]
        orderedViewControllers = [firstViewController, secondViewController, thirdViewControlelr] as! [UIViewController]

        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        self.pageViewController.setViewControllers(vcs, direction: .forward, animated: true, completion: nil)

        self.pageViewController.view.frame = self.viewCutom.viewPage.bounds //self.profileView.bottomView.bounds
        self.viewCutom.viewPage.addSubview(self.pageViewController.view)
        self.addChild(self.pageViewController!)
        pageViewController?.didMove(toParent: self)
        loadViewIfNeeded()
    }
    
    @objc func handlerSkip(_ sender: UIButton) {
        self.navigator?.start(destination: .login)
    }
}

extension FlexOnboardingControlViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.orderedViewControllers.index(of: viewController) {
            print("viewControllerIndex = ", viewControllerIndex)
            viewCutom.pageControl.currentPage = Int((viewControllerIndex))
            if viewControllerIndex < self.orderedViewControllers.count - 1 {
                return self.orderedViewControllers[viewControllerIndex + 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.orderedViewControllers.index(of: viewController) {
            print("viewControllerIndex = ", viewControllerIndex)
            viewCutom.pageControl.currentPage = Int(viewControllerIndex)
            if viewControllerIndex != 0 {
                return self.orderedViewControllers[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
//            if let _ = previousViewControllers[0] as? CatPersonalDataViewController {
//
//            }else{
//
//            }
        }
    }
}
