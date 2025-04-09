//
//  PaymentResultView.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

struct PaymentResultView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
            VStack(spacing: 6) {
                ZStack(alignment: .bottomLeading) {
                    YettelTestAppIOSAsset.Assets.Image.confetti.swiftUIImage
                        .ignoresSafeArea()

                    VStack(alignment: .leading) {
                        Spacer()
                        Text(YettelTestAppIOSStrings.paymentResultTitle)
                            .font(.system(size: 40).bold())
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                    }
                    .padding()
                }
                .frame(height: 320)
                
                HStack {
                    Spacer()
                    YettelTestAppIOSAsset.Assets.Image.paymentSuccessBg
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                }

                Button(YettelTestAppIOSStrings.paymentResultButtonTitle) {
                    viewModel.didTapOkButton()
                }
                .buttonStyle(.primary)
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .background(YettelTestAppIOSAsset.Assets.Color.Bg.neon.swiftUIColor)
            .navigationBarHidden(true)
        }
}

#Preview {
    PaymentResultView()
}
