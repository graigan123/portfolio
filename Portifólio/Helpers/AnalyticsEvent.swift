//
//  Analytcs.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation
import Firebase

struct AnalyticsData {
    var category: Category
    var tag: Tag
}

final class AnalyticsEvent {
    func setEvent(analytics: AnalyticsData) {
        
        Analytics.logEvent(analytics.tag.rawValue, parameters: [
            AnalyticsParameterItemCategory: "\(analytics.category.rawValue)",
            AnalyticsParameterItemID: "\(analytics.tag.rawValue)",
            AnalyticsParameterItemName: "\(analytics.tag.rawValue)",
            AnalyticsParameterContentType: "\(analytics.tag.rawValue)"
        ])
    }
}

enum Tag: String {
    case splashScreen = "splash_screen"
    case onboardingScreen =  "onboarding_screen"
    case homeScreen = "home_screen"
    case loginScreen =  "login_screen"
    case registerScreen = "register_screen"
    case passwordScreen = "password_screen"
    case profileScreen = "profile_screen"
    case settingScreen = "settings_screen"
    case paymentMethodScreen = "payment_method_screen"
    case creditCardRegisterScreen = "credit_card_register_screen"
    case contactToTransferScreen = "contact_to_transfer_screen"
    case amountToTransferScreen = "amount_to_transfer_screen"
    case confirmTransferScreen = "confirm_transfer_screen"
    case successTransferScreen = "success_transfer_screen"
    case statementScreen =  "statement_screen"
    case qrcodeScannerScreen = "qrcode_scanner_screen"
    case spendingScreen = "spending_screen"
    case spendingDetailScreen = "spending_detail_screen"
    case paymentScreen = "payment_screen"
    case successPaymentScreen = "success_payment_screen"
}

enum Category: String {
    case splash = "Splash"
    case onboarding = "Onboarding"
    case home = "Home"
    case login = "Login"
    case register = "Cadastro"
    case registerPassword = "Cadastro de senha"
    case profile = "Perfil"
    case config = "Configurações"
    case paymentMethods = "Formas de pagamento"
    case creditCardRegister = "Cadastro de cartão"
    case contactToTransfer = "Selecionar contato para transferência"
    case amountToTransfer = "Valor para transferência"
    case confirmTransfer = "Confirmação de transferência"
    case successTransfer = "Transferência efetuada com sucesso"
    case statement = "Extrato"
    case qrcodeScanner = "Scanner"
    case spending = "Consumo"
    case spendingDetail = "Detalhe do consumo"
    case payment = "Pagamento"
    case successPayment = "Pagamento com sucesso"
}
