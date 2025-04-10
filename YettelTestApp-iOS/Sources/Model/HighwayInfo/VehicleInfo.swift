//
//  VehicleInfo.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import Foundation

public struct VehicleInfo: Codable {
    let internationalRegistrationCode: String
    let type: String
    let name: String
    let plate: String
    let country: LocalizedCountry
    let vignetteType: String
}
