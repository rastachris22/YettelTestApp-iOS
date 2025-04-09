//
//  PaymentConfirmationViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

extension PaymentConfirmationView {
    final class ViewModel: ObservableObject {
        @Published var plateNumber = ""
        @Published var vignetteType: VignetteType = .month
        @Published var highwayVignettes: [HighwayVignette] = []
        @Published var trxFeeString: String = ""
        @Published var sumString: String = ""
        
        private let numberFormatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.currencyCode = YettelTestAppIOSStrings.currency
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter
        }()
        
        private var trxFee: Int = 0 {
            didSet {
                trxFeeString = numberFormatter.string(from: NSNumber(value: trxFee)) ?? ""
            }
        }
        private var sum: Int = 0 {
            didSet {
                sumString = numberFormatter.string(from: NSNumber(value: sum)) ?? ""
            }
        }
        
        init(
            plateNumber: String = "",
            vignetteType: VignetteType,
            highwayVignettes: [HighwayVignette]
        ) {
            self.plateNumber = plateNumber
            self.vignetteType = vignetteType
            self.highwayVignettes = highwayVignettes
            
            self.highwayVignettes.forEach { vignette in
                trxFee += vignette.trxFee
                sum += vignette.sum
            }
        }
    }
}
