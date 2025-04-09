//
//  HighwayInfo.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import Foundation
import SwiftUI

// MARK: - Root Payload Container
public struct HighwayInfo: Codable {
    let highwayVignettes: [HighwayVignette]
    let vehicleCategories: [VehicleCategory]
    let counties: [County]
}

public enum HighwayInfoError: Error {
    case general
}

// MARK: - Highway Vignette
public struct HighwayVignette: Codable, Equatable, Hashable {
    let vignetteType: [VignetteType]
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

public enum VignetteType: String, Codable, Hashable {
    case day = "DAY"
    case week = "WEEK"
    case month = "MONTH"
    case year = "YEAR"
    case year11 = "YEAR_11"
    case year12 = "YEAR_12"
    case year13 = "YEAR_13"
    case year14 = "YEAR_14"
    case year15 = "YEAR_15"
    case year16 = "YEAR_16"
    case year17 = "YEAR_17"
    case year18 = "YEAR_18"
    case year19 = "YEAR_19"
    case year20 = "YEAR_20"
    case year21 = "YEAR_21"
    case year22 = "YEAR_22"
    case year23 = "YEAR_23"
    case year24 = "YEAR_24"
    case year25 = "YEAR_25"
    case year26 = "YEAR_26"
    case year27 = "YEAR_27"
    case year28 = "YEAR_28"
    case year29 = "YEAR_29"
    
    var title: String? {
        switch self {
        case .day:
            return YettelTestAppIOSStrings.vignetteTypeDayTitle
        case .week:
            return YettelTestAppIOSStrings.vignetteTypeWeekTitle
        case .month:
            return YettelTestAppIOSStrings.vignetteTypeMonthTitle
        default: return nil
        }
    }
    
    var paymentConfirmationTitle: String {
        switch self {
        case .year:
            return YettelTestAppIOSStrings.vignetteTypeYearPaymentConfirmationTitle
        default:
            return YettelTestAppIOSStrings.vignetteTypeOtherPaymentConfirmationTitle
        }
    }
}

// MARK: - Vehicle Category
public struct VehicleCategory: Codable, Equatable, Hashable {
    let category: String
    let vignetteCategory: String
    let name: LocalizedName
    
    var icon: Image? {
        if category == "CAR" {
            return YettelTestAppIOSAsset.Assets.Icon.carIcon.swiftUIImage
        }
        return nil
    }
}

// MARK: - Localized Name
public struct LocalizedName: Codable, Equatable, Hashable {
    let hu: String
    let en: String
}

// MARK: - County
public struct County: Codable, Hashable {
    let id: String
    let name: String
}
