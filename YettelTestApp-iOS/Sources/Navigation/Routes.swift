//
//  Routes.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

enum Routes: Hashable {
    case highwayVignettes
    case yearlyHighwayVignettes
    case paymentConfirmation(
        plateNumber: String,
        vignetteType: VignetteType,
        highwayVignettes: [HighwayVignette]
    )
    case paymentResult
}
