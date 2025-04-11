//
//  Container+Services.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import Foundation
import Factory
import OpenAPIRuntime
import OpenAPIURLSession

extension Container {
    public var client: Factory<APIProtocol> {
        self {
            Client(serverURL: URL(string: "http://0.0.0.0:8080")!, transport: URLSessionTransport())
        }
    }
    public var highwayInfoInteractor: Factory<HighwayInfoInteractorType> {
        self {
            HighwayInfoInteractor()
        }
    }
    public var paymentInteractor: Factory<PaymentInteractorType> {
        self {
            PaymentInteractor()
        }
    }
    public var coordinator: Factory<CoordinatorType> {
        self {
            Coordinator()
        }
        .singleton
    }
    public var globalErrorManager: Factory<GlobalErrorManagerType> {
        self {
            GlobalErrorManager()
        }
        .singleton
    }
}
