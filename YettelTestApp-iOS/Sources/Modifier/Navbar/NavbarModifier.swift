//
//  NavbarModifier.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

struct NavbarModifier: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(YettelTestAppIOSAsset.Assets.Color.Bg.neon.swiftUIColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func navbar(
        title: String
    ) -> some View {
        return self
            .modifier(
                NavbarModifier(title: title)
            )
    }
}
