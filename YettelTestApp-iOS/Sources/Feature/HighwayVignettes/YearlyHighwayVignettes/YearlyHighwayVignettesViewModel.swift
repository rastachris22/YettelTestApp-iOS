//
//  YearlyHighwayVignettesViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

extension YearlyHighwayVignettesView {
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
        
        init(
            highwayVignette: HighwayVignette,
            counties: [County]
        ) {
            self.highwayVignette = highwayVignette
            self.counties = counties
            self.selectedCounties = []
        }
        
        func selectCounty(_ county: County) {
            if selectedCounties.contains(county) {
                selectedCounties.remove(county)
            } else {
                selectedCounties.insert(county)
            }
        }
    }
}
