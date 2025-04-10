//
//  VehicleCategory.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import SwiftUI

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
