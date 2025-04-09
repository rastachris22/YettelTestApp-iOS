//
//  YearlyHighwayVignettesView.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 09..
//

import SwiftUI

struct YearlyHighwayVignettesView: View {
    
    @StateObject private var viewModel: ViewModel
    
    init(
        highwayVignette: HighwayVignette,
        counties: [County]
    ) {
        _viewModel = StateObject(
            wrappedValue: ViewModel(
                highwayVignette: highwayVignette,
                counties: counties
            )
        )
    }
    
    var body: some View {
           VStack(spacing: 0) {
               ScrollView {
                   Spacer()
                       .frame(height: 16)
                   VStack(spacing: 16) {
                       Text(YettelTestAppIOSStrings.yearlyHighwayVignettesYearlyVignettesTitle)
                           .font(.system(size: 20).bold())
                           .frame(maxWidth: .infinity, alignment: .leading)

                       ForEach(viewModel.counties, id: \.hashValue) { county in
                           HStack {
                               Button(action: {
                                   viewModel.selectCounty(county)
                               }) {
                                   Image(systemName: viewModel.selectedCounties.contains(county) ? "checkmark.square.fill" : "square")
                                       .foregroundStyle(viewModel.selectedCounties.contains(county) ? YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor : .gray)
                               }

                               Text(county.name)
                                   .font(.system(size: 16))
                                   .foregroundColor(viewModel.selectedCounties.contains(county) ? .gray : .primary)

                               Spacer()

                               Text(viewModel.highwayVignette?.price ?? "")
                                   .font(.system(size: 16).bold())
                                   .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor)
                           }
                           .padding(.vertical, 4)
                       }
                   }
                   .padding()
                   
                   Divider()
                       .padding(.horizontal)
                   
                   VStack(spacing: 12) {
                       HStack {
                           Text(YettelTestAppIOSStrings.yearlyHighwayVignettesAmountLabel)
                               .font(.system(size: 12))
                               .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor)
                           Spacer()
                       }

                       HStack {
                           Text(viewModel.costString)
                               .font(.system(size: 40).bold())
                               .foregroundColor(YettelTestAppIOSAsset.Assets.Color.Text.primary.swiftUIColor)
                           Spacer()
                       }
                       .padding(.bottom, 16)
                   }
                   .padding()
                   
                   Button(YettelTestAppIOSStrings.yearlyHighwayVignettesPayButtonTitle) {
                       viewModel.didTapNextButton()
                   }
                   .buttonStyle(.primary)
               }
           }
           .padding(.horizontal, 16)
           .navbar(title: YettelTestAppIOSStrings.yearlyHighwayVignettesTitle)
       }
}

#Preview {
    YearlyHighwayVignettesView(
        highwayVignette: HighwayVignette(
            vignetteType: [.year],
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
        ),
        counties: [
            County(id: "YEAR11", name: "Bács-Kiskun"),
            County(id: "YEAR12", name: "Csongrád")
        ]
    )
}
