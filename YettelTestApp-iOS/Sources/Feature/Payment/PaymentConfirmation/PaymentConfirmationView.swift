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
        vignetteType: VignetteType,
        highwayVignettes: [HighwayVignette]
    ) {
        _viewModel = StateObject(
            wrappedValue: ViewModel(
                plateNumber: plateNumber,
                vignetteType: vignetteType,
                highwayVignettes: highwayVignettes
            )
        )
    }
    
    var body: some View {
        VStack(spacing: 16) {
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
                        Text(viewModel.vignetteType.paymentConfirmationTitle)
                            .font(.system(size: 14))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                    }
                }
                .padding(.vertical, 16)
                
                Divider()
                
                VStack(spacing: 16) {
                    ForEach(viewModel.highwayVignettes, id: \.vignetteType) { vignette in
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
                // TODO: - Call viewModel method
            }
            .buttonStyle(.primary)
            
            Button(YettelTestAppIOSStrings.paymentConfirmationCancelButtonTitle) {
                // TODO: - Call viewModel method
            }
            .buttonStyle(.secondary)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    PaymentConfirmationView(
        plateNumber: "ABC-123",
        vignetteType: .day,
        highwayVignettes: [
            HighwayVignette(
                vignetteType: [.week],
                vehicleCategory:
                    VehicleCategory(
                        category: "CAR",
                        vignetteCategory: "D1",
                        name: LocalizedName(
                            hu: "Személygépjármű",
                            en: "Car"
                        )
                    ),
                cost: 6600,
                trxFee: 200,
                sum: 6800
            )
        ]
    )
}
