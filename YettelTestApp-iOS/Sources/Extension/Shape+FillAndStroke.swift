//
//  Shape+FillAndStroke.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import SwiftUI

extension Shape {
    func fillAndStroke(_ fillColor: Color) -> some View {
        return self
            .fill(fillColor)
            .overlay {
                self.stroke(Color.white, lineWidth: 1)
            }
    }
}
