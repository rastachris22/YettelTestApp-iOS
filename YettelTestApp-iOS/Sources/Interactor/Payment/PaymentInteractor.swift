//
//  PaymentInteractor.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import Foundation
import OpenAPIRuntime
import Factory
import Mockable

@Mockable
public protocol PaymentInteractorType: Actor {
    func postPayment(orderPayloadItems: [OrderPayloadItem]) async -> Result<Void, OrderError>
}

final actor PaymentInteractor: PaymentInteractorType {
    
    @Injected(\.client) var client: APIProtocol
    
    func postPayment(orderPayloadItems: [OrderPayloadItem]) async -> Result<Void, OrderError> {
        do {
            let highwayOrders = orderPayloadItems.map { item in
                Operations.postHighwayOrder.Input.Body.jsonPayload.highwayOrdersPayloadPayload(
                    _type: item.type,
                    category: item.category,
                    cost: Float(item.cost)
                )
            }
            let response = try await client.postHighwayOrder(.init(body: .json(.init(highwayOrders: highwayOrders))))
            switch response {
            case .ok(_): return .success(())
            default: return .failure(.general)
            }
        } catch {
            return .failure(.general)
        }
    }
}
