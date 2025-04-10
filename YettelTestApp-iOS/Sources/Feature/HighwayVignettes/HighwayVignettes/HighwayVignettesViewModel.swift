//
//  HighwayVignettesViewModel.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import SwiftUI
import Factory

extension HighwayVignettesView {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published var vehicleInfo: VehicleInfo?
        @Published var currentVehicleCategory: VehicleCategory?
        
        @Published var nationalVignettes: [HighwayVignette] = []
        @Published var selectedNationalVignette: HighwayVignette?
        
        @Injected(\.highwayInfoInteractor) private var highwayInfoInteractor: HighwayInfoInteractorType
        @Injected(\.coordinator) private var coordinator: Coordinator
        @Injected(\.globalErrorManager) private var globalErrorManager: GlobalErrorManager
        
        private var vehicleCategories: [VehicleCategory] = []
        private var yearlyVignette: HighwayVignette?
        private var counties: [County] = []
        
        func didTapPayButton() {
            guard let selectedNationalVignette else {
                globalErrorManager.show(message: YettelTestAppIOSStrings.highwayVignettesNotSelectedVignetteErrorMessage)
                return
            }
            let selectedVignette = SelectedVignette(
                title: selectedNationalVignette.title,
                cost: selectedNationalVignette.cost,
                trxFee: selectedNationalVignette.trxFee,
                sum: selectedNationalVignette.sum,
                type: selectedNationalVignette.vignetteType.first?.rawValue ?? "",
                category: selectedNationalVignette.vehicleCategory?.category ?? ""
            )
            coordinator.push(route:
                    .paymentConfirmation(
                        plateNumber: vehicleInfo?.plate ?? "",
                        selectedVignettes: [selectedVignette]
                    )
            )
        }
        
        func didTapYearlyVignettesButton() {
            guard let yearlyVignette else { return }
            coordinator.push(route:
                    .yearlyHighwayVignettes(
                        plateNumber: vehicleInfo?.plate ?? "",
                        highwayVignette: yearlyVignette,
                        counties: counties
                    )
            )
        }
        
        func fetchHighwayInfo() async {
            let result = await highwayInfoInteractor.fetchHighwayInfo()
            switch result {
            case .success(let value):
                nationalVignettes = value.highwayVignettes.filter({ vignette in
                    vignette.vignetteType.contains(.day) || vignette.vignetteType.contains(.month) || vignette.vignetteType.contains(.week)
                })
                yearlyVignette = value.highwayVignettes.first(where: { vignette in
                    vignette.vignetteType.contains(.year)
                })
                vehicleCategories = value.vehicleCategories
                counties = value.counties
            case .failure(let error):
                globalErrorManager.show(error: error)
            }
        }
        
        func fetchVehicleInfo() async {
            let result = await highwayInfoInteractor.fetchVehicleInfo()
            switch result {
            case .success(let value):
                vehicleInfo = value
                currentVehicleCategory = vehicleCategories.first(where: { vehicleCategory in
                    vehicleCategory.category == value.type
                })
            case .failure(let error):
                globalErrorManager.show(error: error)
            }
        }
    }
}
