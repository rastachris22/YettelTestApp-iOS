//
//  HighwayInfoError.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import Foundation

public enum HighwayInfoError: Error {
    case general
    
    var localizedDescription: String {
        switch self {
        case .general:
            return YettelTestAppIOSStrings.generalErrorMessage
        }
    }
}

extension HighwayInfoError: LocalizedError {
    public var errorDescription: String? { return localizedDescription }
}
