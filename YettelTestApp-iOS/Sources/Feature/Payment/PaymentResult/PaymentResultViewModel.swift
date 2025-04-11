//
//  PaymentResultViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import Factory
import SwiftUI

extension PaymentResultView {
    final class ViewModel: ObservableObject {
        
        @Injected(\.coordinator) private var coordinator: CoordinatorType
        
        func didTapOkButton() {
            coordinator.popToRoot()
        }
    }
}
