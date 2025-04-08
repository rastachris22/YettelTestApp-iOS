//
//  RadioButtonView.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import SwiftUI

struct RadioButtonView: View {
    let title: String
    let price: String
    let isSelected: Bool

    var body: some View {
        HStack {
            // Custom radio indicator
            ZStack {
                Circle()
                    .stroke(
                        isSelected
                            ? YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor
                            : Color.gray.opacity(0.3),
                        lineWidth: 2
                    )
                    .frame(width: 24, height: 24)
                if isSelected {
                    Circle()
                        .fill(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
                        .frame(width: 12, height: 12)
                }
            }

            // Title and subtitle
            HStack {
                Text(title)
                    .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor)
            }

            Spacer()

            // Price
            Text(price)
                .fontWeight(.bold)
                .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor)
        }
        .frame(height: 60)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isSelected
                    ? YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor
                    : Color.gray.opacity(0.15), lineWidth: isSelected ? 2 : 1
                )
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                )
        )
    }
}
