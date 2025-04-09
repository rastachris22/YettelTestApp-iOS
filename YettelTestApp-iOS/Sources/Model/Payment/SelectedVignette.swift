//
//  SelectedVignette.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import Foundation

public struct SelectedVignette: Hashable {
    let title: String
    let cost: Int
    let trxFee: Int
    let sum: Int
    let type: String
    let category: String
}

extension SelectedVignette {
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = YettelTestAppIOSStrings.currency
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: cost)) ?? ""
    }
}

extension SelectedVignette {
    var typeTitle: String {
        if type.contains("YEAR") {
            return YettelTestAppIOSStrings.vignetteTypeYearPaymentConfirmationTitle
        } else {
            return YettelTestAppIOSStrings.vignetteTypeOtherPaymentConfirmationTitle
        }
    }
}
