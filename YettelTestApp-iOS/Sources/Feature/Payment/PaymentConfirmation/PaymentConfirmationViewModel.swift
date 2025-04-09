//
//  PaymentConfirmationViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI
import Factory

extension PaymentConfirmationView {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published var plateNumber = ""
        @Published var selectedVignettes: [SelectedVignette] = []
        @Published var trxFeeString: String = ""
        @Published var sumString: String = ""
        
        @Injected(\.paymentInteractor) private var paymentInteractor: PaymentInteractorType
        @Injected(\.coordinator) private var coordinator: Coordinator
                
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
            selectedVignettes: [SelectedVignette]
        ) {
            self.plateNumber = plateNumber
            self.selectedVignettes = selectedVignettes
            
            self.selectedVignettes.forEach { vignette in
                trxFee += vignette.trxFee
                sum += vignette.sum
            }
        }
        
        func didTapPayButton() {
            Task {
                await sendOrder()
            }
        }
        
        private func sendOrder() async {
            let orderPayloadItems = selectedVignettes.map { selectedVignette in
                OrderPayloadItem(
                    type: selectedVignette.type,
                    category: selectedVignette.category,
                    cost: selectedVignette.cost
                )
            }
                    
            let result = await paymentInteractor.postPayment(orderPayloadItems: orderPayloadItems)
            if case .success = result {
                coordinator.push(route: .paymentResult)
            }
        }
    }
}
