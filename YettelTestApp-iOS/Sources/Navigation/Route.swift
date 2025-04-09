//
//  Route.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

public enum Route: Hashable {
    case highwayVignettes
    case yearlyHighwayVignettes(
        highwayVignette: HighwayVignette,
        counties: [County]
    )
    case paymentConfirmation(
        plateNumber: String,
        selectedVignettes: [SelectedVignette]
    )
    case paymentResult
}
