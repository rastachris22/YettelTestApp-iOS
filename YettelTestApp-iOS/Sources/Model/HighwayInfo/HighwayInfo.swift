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
public struct HighwayVignette: Codable, Equatable {
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
        return numberFormatter.string(from: NSNumber(value: sum)) ?? ""
    }
}

public enum VignetteType: String, Codable {
    case day = "DAY"
    case week = "WEEK"
    case month = "MONTH"
    case year = "YEAR"
    
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
}

// MARK: - Vehicle Category
public struct VehicleCategory: Codable, Equatable {
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
public struct LocalizedName: Codable, Equatable {
    let hu: String
    let en: String
}

// MARK: - County
public struct County: Codable {
    let id: String
    let name: String
}
