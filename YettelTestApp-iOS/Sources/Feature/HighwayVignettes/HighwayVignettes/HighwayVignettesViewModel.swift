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
        
        private var vehicleCategories: [VehicleCategory] = []
        
        @Injected(\.highwayInfoInteractor) private var highwayInfoInteractor: HighwayInfoInteractorType
        
        func fetchHighwayInfo() async {
            let result = await highwayInfoInteractor.fetchHighwayInfo()
            switch result {
            case .success(let value):
                nationalVignettes = value.highwayVignettes.filter({ vignette in
                    vignette.vignetteType.contains(.day) || vignette.vignetteType.contains(.month) || vignette.vignetteType.contains(.week)
                })
                vehicleCategories = value.vehicleCategories
            case .failure(let error):
                print(error)
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
                print(error)
            }
        }
    }
}
