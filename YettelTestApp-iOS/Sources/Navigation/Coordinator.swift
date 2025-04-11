//
//  Coordinator.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI
import Mockable

@Mockable
public protocol CoordinatorType: Observable {
    var path: NavigationPath { get }
    var initialRoute: Route { get }
    func push(route: Route)
    func pop()
    func popToRoot()
}

@Observable
final class Coordinator: CoordinatorType {
    var path: NavigationPath = NavigationPath()
    var initialRoute: Route = .highwayVignettes
    
    func push(route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
