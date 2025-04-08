//
//  SecondaryButtonStyle.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//


import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(Color.white)
            .overlay(
                Capsule()
                    .stroke(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor, lineWidth: 2)
            )
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: SecondaryButtonStyle { SecondaryButtonStyle() }
}

#Preview {
    Button("Mégsem") {
        
    }.buttonStyle(.secondary)
}
    
