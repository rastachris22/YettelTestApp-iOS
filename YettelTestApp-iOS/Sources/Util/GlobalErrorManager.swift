//
//  GlobalErrorManager.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//


import SwiftUI
import Combine
import Mockable

@Mockable
public protocol GlobalErrorManagerType {
    var errorMessage: String? { get }
    func show(error: Error)
    func show(message: String)
    func clear()
}

@Observable
final class GlobalErrorManager: GlobalErrorManagerType {
    var errorMessage: String? = nil
    
    func show(error: Error) {
        errorMessage = error.localizedDescription
    }
    
    func show(message: String) {
        errorMessage = message
    }
    
    func clear() {
        errorMessage = nil
    }
}

public struct ErrorWrapper: Identifiable {
    public let id = UUID()
    public let message: String
}
