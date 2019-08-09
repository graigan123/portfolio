//
//  OneSignal.swift
//  Elo
//
//  Created by Gabriel Miranda Silveira on 14/02/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import OneSignal

struct OneSignalHelper {
    static func configure(launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        let oneSignalAppId = Environment.oneSignalAppId
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: oneSignalAppId,
                                        handleNotificationAction: nil,
                                        settings: [kOSSettingsKeyAutoPrompt: false])
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification
        OneSignal.promptForPushNotifications { accepted in
            print("User accepted notifications: \(accepted)")
        }
    }
    
    static func sendUserId(id: String) {
        OneSignal.sendTag("id4all", value: id)
    }
    
    static func logout() {
        OneSignal.sendTag("id4all", value: "guest")
    }
}
