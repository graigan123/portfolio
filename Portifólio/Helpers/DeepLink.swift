//
//  DeepLink.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public enum DeepLink {
    case whatsapp(number: String)
    
    public func execute() {
        switch self {
        case .whatsapp(var number):
            
//            number = "+5585998121685"
            
            let urlString = "whatsapp://send?phone=\(number)"
            let itunesUrl = "https://itunes.apple.com/br/app/whatsapp-messenger/id310633997?mt=8"
            executeAction(urlString: urlString, itunesUrlString: itunesUrl)
        }
    }
    
    private func executeAction(urlString: String, itunesUrlString: String? = nil) {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            if let itunesUrlString = itunesUrlString, let itunesUrl = URL(string: itunesUrlString) {
                if UIApplication.shared.canOpenURL(itunesUrl) {
                    UIApplication.shared.open(itunesUrl, options: [:], completionHandler: nil)
                }
            }
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
