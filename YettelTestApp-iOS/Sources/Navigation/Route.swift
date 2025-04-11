//
//  Route.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

public enum Route: Hashable {
    case highwayVignettes
    case yearlyHighwayVignettes(
        plateNumber: String,
        highwayVignette: HighwayVignette,
        counties: [County]
    )
    case paymentConfirmation(
        plateNumber: String,
        selectedVignettes: [SelectedVignette]
    )
    case paymentResult
}

extension Route {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .highwayVignettes: HighwayVignettesView()
        case let .yearlyHighwayVignettes(plateNumber, highwayVignette, counties):
            YearlyHighwayVignettesView(
                plateNumber: plateNumber,
                highwayVignette: highwayVignette,
                counties: counties
            )
        case let .paymentConfirmation(plateNumber, selectedVignettes):
            PaymentConfirmationView(
                plateNumber: plateNumber,
                selectedVignettes: selectedVignettes
            )
        case .paymentResult: PaymentResultView()
        }
    }
}
