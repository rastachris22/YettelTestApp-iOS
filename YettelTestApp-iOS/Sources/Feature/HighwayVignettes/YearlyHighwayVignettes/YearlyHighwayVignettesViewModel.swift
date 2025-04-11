//
//  YearlyHighwayVignettesViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI
import Factory

extension YearlyHighwayVignettesView {
    @MainActor
    final class ViewModel: ObservableObject {
        
        @Published var highwayVignette: HighwayVignette?
        @Published var counties: [County] = []
        @Published var selectedCounties: Set<County> = [] {
            didSet {
                cost = 0
                selectedCounties.forEach { _ in
                    cost += highwayVignette?.cost ?? 0
                }
            }
        }
        @Published var costString: String = ""
        
        @Injected(\.coordinator) private var coordinator: CoordinatorType
        @Injected(\.globalErrorManager) private var globalErrorManager: GlobalErrorManagerType
        
        private let numberFormatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.currencyCode = YettelTestAppIOSStrings.currency
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter
        }()
        
        private var cost: Int = 0 {
            didSet {
                costString = numberFormatter.string(from: NSNumber(value: cost)) ?? ""
            }
        }
        private var plateNumber: String = ""
        
        init(
            plateNumber: String,
            highwayVignette: HighwayVignette,
            counties: [County]
        ) {
            self.plateNumber = plateNumber
            self.highwayVignette = highwayVignette
            self.counties = counties
            self.selectedCounties = []
        }
        
        func didTapNextButton() {
            guard let highwayVignette, !selectedCounties.isEmpty else {
                globalErrorManager.show(message: YettelTestAppIOSStrings.highwayVignettesNotSelectedVignetteErrorMessage)
                return
            }
            let selectedVignettes = selectedCounties.map { county in
                SelectedVignette(
                    title: county.name,
                    cost: highwayVignette.cost,
                    trxFee: highwayVignette.trxFee,
                    sum: highwayVignette.sum,
                    type: county.id,
                    category: highwayVignette.vehicleCategory?.category ?? ""
                )
            }
            coordinator.push(route:
                    .paymentConfirmation(
                        plateNumber: plateNumber,
                        selectedVignettes: selectedVignettes
                    )
            )
        }
        
        func selectCounty(_ county: County) {
            if selectedCounties.contains(county) {
                selectedCounties.remove(county)
            } else {
                let adjacentCounties = Set(
                    selectedCounties
                        .compactMap { county in
                            county.adjacentCounties
                        }.flatMap { $0 }
                )
                if !selectedCounties.isEmpty, !adjacentCounties.contains(county.id) {
                    globalErrorManager.show(message: YettelTestAppIOSStrings.yearlyHighwayVignettesSelectedVignetteWarningMessage)
                }
                selectedCounties.insert(county)
            }
        }
    }
}
