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

@Suite("HighwayVignettesViewModel Tests")
struct HighwayVignettesViewModelTests {

    @Suite("Fetch Highway Info") struct HighwayInfoTests {
        
        @Test("fetchHighwayInfo - success") func success() async throws {
            // Given
            let mockInteractor = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }

            let vignette = HighwayVignette(
                vignetteType: [.day],
                vehicleCategory: nil,
                cost: 1000,
                trxFee: 100,
                sum: 1100
            )
            let highwayInfo = HighwayInfo(
                highwayVignettes: [vignette],
                vehicleCategories: [],
                counties: []
            )
            given(mockInteractor).fetchHighwayInfo().willReturn(.success(highwayInfo))
            let sut = HighwayVignettesView.ViewModel()

            // When
            await sut.fetchHighwayInfo()

            // Then
            #expect(sut.nationalVignettes.count == 1)
        }

        @Test("fetchHighwayInfo - failure") func failure() async throws {
            // Given
            let mockGlobalErrorManager = MockGlobalErrorManagerType(policy: .relaxedMocked)
            Container.shared.globalErrorManager.register { mockGlobalErrorManager }
            Matcher.register(Error.self, match: { _, _ in true })
            given(mockGlobalErrorManager).show(error: .any).willReturn()

            let mockInteractor = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }
            given(mockInteractor).fetchHighwayInfo().willReturn(.failure(.general))

            let sut = HighwayVignettesView.ViewModel()

            // When
            await sut.fetchHighwayInfo()

            // Then
            #expect(sut.nationalVignettes.isEmpty)
            verify(mockGlobalErrorManager).show(error: .any).called(1)
        }
    }

    @Suite("Fetch Vehicle Info") struct VehicleInfoTests {

        @Test("fetchVehicleInfo - success") func success() async throws {
            // Given
            let mockInteractor = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }

            let vehicleInfo = VehicleInfo(
                            internationalRegistrationCode: "H",
                            type: "CAR",
                            name: "Test Car",
                            plate: "ABC123",
                            country: LocalizedCountry(hu: "Magyarország", en: "Hungary"),
                            vignetteType: "D1"
                        )
            let category = VehicleCategory(category: "CAR", vignetteCategory: "D1", name: .init(hu: "", en: ""))

            let highwayInfo = HighwayInfo(highwayVignettes: [], vehicleCategories: [category], counties: [])
            given(mockInteractor).fetchHighwayInfo().willReturn(.success(highwayInfo))
            given(mockInteractor).fetchVehicleInfo().willReturn(.success(vehicleInfo))

            // When
            let sut = HighwayVignettesView.ViewModel()
            await sut.fetchHighwayInfo()
            await sut.fetchVehicleInfo()

            // Then
            #expect(sut.vehicleInfo?.plate == "ABC123")
            #expect(sut.currentVehicleCategory?.category == "CAR")
        }

        @Test("fetchVehicleInfo - failure") func failure() async throws {
            // Given
            let mockGlobalErrorManager = MockGlobalErrorManagerType(policy: .relaxedMocked)
            Container.shared.globalErrorManager.register { mockGlobalErrorManager }
            Matcher.register(Error.self, match: { _, _ in true })
            given(mockGlobalErrorManager).show(error: .any).willReturn()

            let mockInteractor = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }
            given(mockInteractor).fetchVehicleInfo().willReturn(.failure(.general))

            let sut = HighwayVignettesView.ViewModel()
            
            // When
            await sut.fetchVehicleInfo()

            // Then
            verify(mockGlobalErrorManager).show(error: .any).called(1)
        }
    }

    @Suite("Navigation") struct NavigationTests {

        @Test("didTapPayButton - success") func payButtonPushes() {
            // Given
            let mockCoordinator = MockCoordinatorType()
            Container.shared.coordinator.register { mockCoordinator }

            let vignette = HighwayVignette(
                vignetteType: [.day],
                vehicleCategory: .init(category: "CAR", vignetteCategory: "", name: .init(hu: "", en: "")),
                cost: 1000,
                trxFee: 200,
                sum: 1200
            )

            let sut = HighwayVignettesView.ViewModel()
            sut.selectedNationalVignette = vignette
            sut.vehicleInfo = VehicleInfo(
                internationalRegistrationCode: "H",
                type: "CAR",
                name: "Test Car",
                plate: "ABC123",
                country: LocalizedCountry(hu: "Magyarország", en: "Hungary"),
                vignetteType: "D1"
            )

            given(mockCoordinator).push(route: .any).willReturn()
            
            // When
            sut.didTapPayButton()

            // Then
            verify(mockCoordinator).push(route: .matching {
                if case let .paymentConfirmation(plate, vignettes) = $0 {
                    return plate == "ABC123" && vignettes.count == 1
                }
                return false
            }).called(1)
        }

        @Test("didTapPayButton - no selection") func payButtonFailsWithoutVignette() {
            // Given
            let mockGlobalErrorManager = MockGlobalErrorManagerType(policy: .relaxedMocked)
            Container.shared.globalErrorManager.register { mockGlobalErrorManager }
            given(mockGlobalErrorManager).show(message: .value(YettelTestAppIOSStrings.highwayVignettesNotSelectedVignetteErrorMessage)).willReturn()

            let sut = HighwayVignettesView.ViewModel()
            
            // When
            sut.didTapPayButton()

            // Then
            verify(mockGlobalErrorManager).show(message: .value(YettelTestAppIOSStrings.highwayVignettesNotSelectedVignetteErrorMessage)).called(1)
        }

        @Test("didTapYearlyVignettesButton - success") func yearlyPushes() async {
            // Given
            let mockCoordinator = MockCoordinatorType()
            Container.shared.coordinator.register { mockCoordinator }
            let mockInteractor = MockHighwayInfoInteractorType()
            Container.shared.highwayInfoInteractor.register { mockInteractor }

            let vignette = HighwayVignette(
                vignetteType: [.year11],
                vehicleCategory: nil,
                cost: 10000,
                trxFee: 0,
                sum: 10000
            )
            let county = County(id: "YEAR_11", name: "Bács-Kiskun")
            
            given(mockCoordinator).push(route: .any).willReturn()
            given(mockInteractor).fetchHighwayInfo().willReturn(.success(HighwayInfo(highwayVignettes: [vignette], vehicleCategories: [], counties: [county])))

            let sut = HighwayVignettesView.ViewModel()
            sut.vehicleInfo = VehicleInfo(
                internationalRegistrationCode: "H",
                type: "CAR",
                name: "Test Car",
                plate: "ABC123",
                country: LocalizedCountry(hu: "Magyarország", en: "Hungary"),
                vignetteType: "D1"
            )
            
            await sut.fetchHighwayInfo()
            
            // When
            sut.didTapYearlyVignettesButton()

            // Then
            verify(mockCoordinator).push(route: .matching {
                if case let .yearlyHighwayVignettes(plate, v, counties) = $0 {
                    return plate == "ABC123" && v.sum == 10000 && counties.count == 1
                }
                return false
            }).called(1)
        }
    }
}

