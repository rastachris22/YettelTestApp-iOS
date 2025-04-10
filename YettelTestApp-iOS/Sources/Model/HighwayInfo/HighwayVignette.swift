//
//  HighwayVignette.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import Foundation

// MARK: - Highway Vignette
public struct HighwayVignette: Codable, Equatable, Hashable {
    var vignetteType: [VignetteType]
    let vehicleCategory: VehicleCategory?
    let cost: Int
    let trxFee: Int
    let sum: Int
    
    var title: String {
        return "\(vehicleCategory?.vignetteCategory ?? "") - \(vignetteType.compactMap { $0.title }.joined(separator: ", "))"
    }
    
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = YettelTestAppIOSStrings.currency
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: cost)) ?? ""
    }
}
