//
//  HighwayVignettesView.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 08..
//

import SwiftUI

struct HighwayVignettesView: View {
    
    @StateObject private var viewModel: ViewModel = .init()
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 16)
                VStack {
                    HStack(spacing: 16) {
                        viewModel.currentVehicleCategory?.icon
                            
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.vehicleInfo?.plate ?? "")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(
                                    YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                                )
                                
                            Text(viewModel.vehicleInfo?.name ?? "")
                                .font(.system(size: 12))
                                .foregroundColor(
                                    YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                                )
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(YettelTestAppIOSStrings.highwayVignettesNationalVignettesTitle)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(
                            YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                        )
                        .padding(.bottom, 12)
                    
                    ForEach(viewModel.nationalVignettes, id: \.vignetteType) { nationalVignette in
                        RadioButtonView(
                            title: nationalVignette.title,
                            price: nationalVignette.price,
                            isSelected: nationalVignette == viewModel.selectedNationalVignette
                        ).onTapGesture {
                            viewModel.selectedNationalVignette = nationalVignette
                        }
                    }
                    
                    Button(YettelTestAppIOSStrings.highwayVignettesPayButtonTitle) {
                        // TODO: - Call viewModel pay method
                        viewModel.didTapPayButton()
                    }
                    .buttonStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 12)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
                .padding()
                
                VStack {
                    HStack {
                        Text(YettelTestAppIOSStrings.highwayVignettesYearlyVignettesTitle)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(
                                YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor
                            )
                        Spacer()
                        
                        YettelTestAppIOSAsset.Assets.Icon.arrowRight.swiftUIImage
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
                .padding(.horizontal)
                .onTapGesture {
                    viewModel.didTapYearlyVignettesButton()
                }
                
                Spacer()
            }
        }
        .background(Color(.systemGray6))
        .task {
            await viewModel.fetchHighwayInfo()
            await viewModel.fetchVehicleInfo()
        }
        .navbar(title: YettelTestAppIOSStrings.highwayVignettesTitle)
    }
}

#Preview {
    HighwayVignettesView()
}
