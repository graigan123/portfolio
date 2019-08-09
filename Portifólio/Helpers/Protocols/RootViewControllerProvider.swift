//
//  RootViewControllerProvider.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

public protocol RootViewControllerProvider: AnyObject {
    // The coordinators 'rootViewController'. It helps to think of this as the view
    // controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
}

/// A Coordinator type that provides a root UIViewController
public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
