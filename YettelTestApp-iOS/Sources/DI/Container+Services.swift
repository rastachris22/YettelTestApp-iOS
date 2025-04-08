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
        
}
