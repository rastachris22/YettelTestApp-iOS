//
//  PaymentConfirmationView.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

struct PaymentConfirmationView: View {
    
    @StateObject private var viewModel: ViewModel
    
    init(
        plateNumber: String,
        selectedVignettes: [SelectedVignette]
    ) {
        _viewModel = StateObject(
            wrappedValue: ViewModel(
                plateNumber: plateNumber,
                selectedVignettes: selectedVignettes
            )
        )
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
                .frame(height: 16)
            VStack(alignment: .leading, spacing: 8) {
                Text(YettelTestAppIOSStrings.paymentConfirmationConfirmationLabel)
                    .font(.system(size: 20).bold())
                    .foregroundColor(
                        YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                    )
                
                Divider()
                
                VStack(spacing: 16) {
                    HStack {
                        Text(YettelTestAppIOSStrings.paymentConfirmationPlatenumberLabel)
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                        Spacer()
                        Text(viewModel.plateNumber)
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                    }
                    
                    HStack {
                        Text(YettelTestAppIOSStrings.paymentConfirmationVignetteTypeLabel)
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                        Spacer()
                        Text(viewModel.selectedVignettes.first?.typeTitle ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                    }
                }
                .padding(.vertical, 16)
                
                Divider()
                
                VStack(spacing: 16) {
                    ForEach(viewModel.selectedVignettes, id: \.hashValue) { vignette in
                        HStack {
                            Text(vignette.title)
                                .font(.system(size: 16).bold())
                                .foregroundColor(
                                    YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                                )
                            Spacer()
                            Text(vignette.price)
                                .font(.system(size: 14))
                                .foregroundColor(
                                    YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                                )
                        }
                    }
                    
                    HStack {
                        Text(YettelTestAppIOSStrings.paymentConfirmationTrxFeeLabel)
                            .font(.system(size: 14).bold())
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                        Spacer()
                        Text(viewModel.trxFeeString)
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                    }
                }
                .padding(.vertical, 16)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(YettelTestAppIOSStrings.paymentConfirmationAmountLabel)
                        .font(.system(size: 12))
                        .foregroundColor(
                            YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                        )
                    Text(viewModel.sumString)
                        .font(.system(size: 40).bold())
                        .foregroundColor(
                            YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                        )
                }
                .padding(.top, 32)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            
            Button(YettelTestAppIOSStrings.paymentConfirmationConfirmationButtonTitle) {
                viewModel.didTapPayButton()
            }
            .buttonStyle(.primary)
            
            Button(YettelTestAppIOSStrings.paymentConfirmationCancelButtonTitle) {
                // TODO: - Call viewModel method
            }
            .buttonStyle(.secondary)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .navbar(title: YettelTestAppIOSStrings.paymentConfirmationTitle)
    }
}

#Preview {
    PaymentConfirmationView(
        plateNumber: "ABC-123",
        selectedVignettes: [
            SelectedVignette(title: "Bács-Kiskun", cost: 6600, trxFee: 200, sum: 6800, type: "YEAR11", category: "D1"),
            SelectedVignette(title: "Csongrád", cost: 6600, trxFee: 200, sum: 6800, type: "YEAR12", category: "D1"),
            SelectedVignette(title: "Tolna", cost: 6600, trxFee: 200, sum: 6800, type: "YEAR13", category: "D1")
        ]
    )
}
