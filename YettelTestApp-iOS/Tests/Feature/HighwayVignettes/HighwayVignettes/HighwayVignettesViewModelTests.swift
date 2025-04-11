//
//  HighwayVignettesViewModelTests.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import Testing
import Factory
import Mockable

@testable import YettelTestApp_iOS

@Suite("HighwayVignettesViewModel Tests") struct HighwayVignettesViewModelTests { // Works ✅
    @Suite("Fetch Vignettes - Success") struct Success {
        var mockInteractor: MockHighwayInfoInteractorType {
            let interactor: MockHighwayInfoInteractorType = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { interactor }
            return interactor
        }
        
        @Test func fetchHighwayInfo() async throws {
            // Given
            let highwayVignettes = [
                HighwayVignette(
                    vignetteType: [.day],
                    vehicleCategory: VehicleCategory(
                        category: "CAR",
                        vignetteCategory: "D1",
                        name: LocalizedName(hu: "Személygépjármű", en: "Car")
                    ),
                    cost: 6600,
                    trxFee: 200,
                    sum: 6800
                )
            ]
            
            let highwayInfo = HighwayInfo(
                highwayVignettes: highwayVignettes,
                vehicleCategories: [],counties: [])
//            given(mockInteractor).fetchHighwayInfo().willReturn(.success(highwayInfo))
            given(mockInteractor).fetchHighwayInfo().willReturn(.failure(.general))
            let sut = HighwayVignettesView.ViewModel()
            
            // When
            await sut.fetchHighwayInfo()
            
            // Then
            #expect(sut.nationalVignettes.count == 1)
        }
    }
    @Suite("Fetch Vignettes - Failure") struct Failure {
        @Test func fetchHighwayInfo() async throws {
            // Given
            let mockGlobalErrorManager: MockGlobalErrorManagerType = MockGlobalErrorManagerType(policy: .relaxedMocked)
            Container.shared.globalErrorManager.register { mockGlobalErrorManager }
            Matcher.register(Error.self, match: { _,_ in true })
            given(mockGlobalErrorManager).show(error: .any).willReturn()
            let mockInteractor: MockHighwayInfoInteractorType = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }
            given(mockInteractor).fetchHighwayInfo().willReturn(.failure(.general))
            let sut = HighwayVignettesView.ViewModel()
            
            // When
            await sut.fetchHighwayInfo()
            
            // Then
            #expect(sut.nationalVignettes.count == 0)
            verify(mockGlobalErrorManager).show(error: .any).called(1)
        }
    }
}


