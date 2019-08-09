//
//  ViewCodeViews.swift
//  Elo
//
//  Created by Diego Vasconcelos on 02/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

protocol ViewCodeViews{
    func setupViews()
    func makeConstraints()
    func initialize()
}

extension ViewCodeViews{
    func initialize(){
        setupViews()
        makeConstraints()
    }
}
