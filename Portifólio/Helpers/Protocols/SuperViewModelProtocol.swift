//
//  SuperViewModelProtocol.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public protocol SuperViewModelProtocol: AnyObject {
    var error: Dynamic<String?> { get }
    var loading: Dynamic<Bool> { get }
}

public class SuperViewModel {
    public var error: Dynamic<String?> = Dynamic(nil)
    public var loading: Dynamic<Bool> = Dynamic(false)
    
    public init() { }
}

extension SuperViewModel: SuperViewModelProtocol { }
