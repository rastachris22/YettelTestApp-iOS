//
//  GlobalErrorManager.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//


import SwiftUI
import Combine

public final class GlobalErrorManager: ObservableObject {
    @Published var errorMessage: String? = nil
    
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
