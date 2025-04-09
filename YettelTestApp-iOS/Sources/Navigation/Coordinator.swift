//
//  Coordinator.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

public final class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(route: Route) -> some View {
        switch route {
        case .highwayVignettes: HighwayVignettesView()
        case let .yearlyHighwayVignettes(highwayVignette, counties):
            YearlyHighwayVignettesView(
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
