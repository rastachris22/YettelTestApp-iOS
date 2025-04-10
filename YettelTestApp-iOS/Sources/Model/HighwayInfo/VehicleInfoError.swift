//
//  VehicleInfoError.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import Foundation

public enum VehicleInfoError: Error {
    case general
    
    var localizedDescription: String {
        switch self {
        case .general:
            return YettelTestAppIOSStrings.generalErrorMessage
        }
    }
}

extension VehicleInfoError: LocalizedError {
    public var errorDescription: String? { return localizedDescription }
}
