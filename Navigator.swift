//
//  Navigator.swift
//  Elo
//
//  Created by Bruna on 13/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}
