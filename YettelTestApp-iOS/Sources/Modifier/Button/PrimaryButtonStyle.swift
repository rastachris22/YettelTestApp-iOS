//
//  PrimaryButtonStyle.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//


import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
                .background(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { PrimaryButtonStyle() }
}

#Preview {
    Button("Mégsem") {
        
    }.buttonStyle(.primary)
}
