//
//  HighwayInfoInteractor.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import Foundation
import OpenAPIRuntime
import Factory
import Mockable

@Mockable
public protocol HighwayInfoInteractorType: Actor {
    func fetchHighwayInfo() async -> Result<HighwayInfo, HighwayInfoError>
    func fetchVehicleInfo() async -> Result<VehicleInfo, VehicleInfoError>
}

final actor HighwayInfoInteractor: HighwayInfoInteractorType {
    
    @Injected(\.client) var client: APIProtocol
    
    func fetchHighwayInfo() async -> Result<HighwayInfo, HighwayInfoError> {
        do {
            let response = try await client.getHighwayInfo(.init())
            switch response {
            case let .ok(okResponse):
                
                // MARK: - VehicleCategories mapping
                
                let mappedVehicleCategories = try okResponse.body.json.payload?.vehicleCategories?.compactMap({ vehicleCategory in
                    return VehicleCategory(
                        category: vehicleCategory.category ?? "",
                        vignetteCategory: vehicleCategory.vignetteCategory ?? "",
                        name: LocalizedName(
                            hu: vehicleCategory.name?.hu ?? "",
                            en: vehicleCategory.name?.en ?? ""
                        )
                    )
                }) ?? []
                
                // MARK: - HighwayVignettes mapping
                
                let mappedHighwayVignettes: [HighwayVignette] = try okResponse.body.json.payload?.highwayVignettes?.compactMap({ highwayVignette in
                    let vignetteType = highwayVignette.vignetteType?.compactMap { vignetteType in
                        VignetteType(rawValue: vignetteType)
                    } ?? []
                    let vehicleCategory = mappedVehicleCategories.first(where: { vehicleCategory in
                        vehicleCategory.category == highwayVignette.vehicleCategory
                    })
                    return HighwayVignette(
                        vignetteType: vignetteType,
                        vehicleCategory: vehicleCategory,
                        cost: Int(highwayVignette.cost ?? 0.0) ,
                        trxFee: Int(highwayVignette.trxFee ?? 0.0),
                        sum: Int(highwayVignette.sum ?? 0.0)
                    )
                }) ?? []
                
                // MARK: - Counties mapping
                
                let mappedCounties = try okResponse.body.json.payload?.counties?.compactMap({ county in
                    return County(id: county.id ?? "", name: county.name ?? "")
                }) ?? []
                    
                return .success(
                    HighwayInfo(
                        highwayVignettes: mappedHighwayVignettes,
                        vehicleCategories: mappedVehicleCategories,
                        counties: mappedCounties
                    )
                )
            default :
                return .failure(.general)
            }
            
        } catch {
            return .failure(.general)
        }
    }
    
    func fetchVehicleInfo() async -> Result<VehicleInfo, VehicleInfoError> {
        do {
            let response = try await client.getVehicleInfo(.init())
            
            switch response {
            case let .ok(okResponse):
                let vehicleInfo = VehicleInfo(
                    internationalRegistrationCode: try okResponse.body.json.internationalRegistrationCode ?? "",
                    type: try okResponse.body.json._type ?? "",
                    name: try okResponse.body.json.name ?? "",
                    plate: try okResponse.body.json.plate ?? "",
                    country: LocalizedCountry(
                        hu: try okResponse.body.json.country?.hu ?? "",
                        en: try okResponse.body.json.country?.en ?? ""
                    ),
                    vignetteType: try okResponse.body.json.vignetteType ?? ""
                )
                
                return .success(vehicleInfo)
            default: return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
}
