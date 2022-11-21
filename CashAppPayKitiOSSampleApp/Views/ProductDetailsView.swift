//
//  ProductDetailsView.swift
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct ProductDetailsView: View {

    let product: Product
    let currencyFormatter: NumberFormatter

    var body: some View {
        VStack {
            Image(uiImage: product.icon.withRenderingMode(.automatic))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(Sizes.cornerRadiusExtraRound)
            VStack {
                Text(product.fullName)
                    .foregroundColor(Asset.Colors.black.swiftUIColor)
                    .font(.displayExtraLargeMedium)
                Text(verbatim: "\(product.price, formatter: currencyFormatter)")
                    .foregroundColor(Asset.Colors.gray20.swiftUIColor)
                    .font(.displayLargeRegular)
            }.padding(
                EdgeInsets(
                    top: Spacing.Vertical.large,
                    leading: .zero,
                    bottom: Spacing.Vertical.minimum,
                    trailing: .zero
                )
            )
            Text(product.description)
                .multilineTextAlignment(.center)
                .font(.displayLargeRegular)
                .foregroundColor(Asset.Colors.gray60.swiftUIColor)
            Spacer()
        }.padding(
            EdgeInsets(
                top: Spacing.Vertical.medium,
                leading: Spacing.Horizontal.large,
                bottom: .zero,
                trailing: Spacing.Horizontal.large
            )
        )
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: .Stubs.largeCoffee, currencyFormatter: .currencyFormatter())
    }
}
