//
//  FlexHomeViewModel.swift
//  Elo
//
//  Created by Diego Vasconcelos on 31/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

protocol FlexHomeProtocol: SuperViewModelProtocol {
    func detailsVC()
}

class FlexHomeViewModel: SuperViewModel, FlexHomeProtocol {
    
    func detailsVC() {
        ()
    }
    func goToDetails() {
        ()
    }
}
