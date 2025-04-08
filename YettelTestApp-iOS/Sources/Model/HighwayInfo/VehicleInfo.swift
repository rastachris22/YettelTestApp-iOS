//
//  VehicleInfo.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

public struct VehicleInfo: Codable {
    let internationalRegistrationCode: String
    let type: String
    let name: String
    let plate: String
    let country: LocalizedCountry
    let vignetteType: String
}

public enum VehicleInfoError: Error {
    case general
}

public struct LocalizedCountry: Codable {
    let hu: String
    let en: String
}
