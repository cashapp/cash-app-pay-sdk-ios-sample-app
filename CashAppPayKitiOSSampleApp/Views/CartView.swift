//
//  CartView.swift
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

struct CartView: View {

    let products: [Product]
    let subtotal: Decimal
    let taxes: Decimal
    let total: Decimal
    let currencyFormatter: NumberFormatter

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Vertical.minimum) {
            Text(L10n.Cart.orderSummary)
                .font(.displayHeader)
                .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                .padding(.bottom, Spacing.Vertical.small)
            VStack {
                ForEach(products, id: \.self) { product in
                    HStack {
                        Image(uiImage: product.icon.withRenderingMode(.automatic))
                            .resizable()
                            .frame(width: Sizes.icon, height: Sizes.icon)
                            .cornerRadius(4)
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.displayLargerMedium)
                                .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                            Text(product.variant)
                                .font(.displaySmallRegular)
                                .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                        }
                        Spacer()
                        HStack {
                            Text(verbatim: "\(product.price, formatter: currencyFormatter)")
                                .font(.displayLargerMedium)
                                .foregroundColor(Asset.Colors.gray20.swiftUIColor)
                        }
                    }
                }
            }.padding(.bottom, Spacing.Vertical.small)
            HStack {
                Text(L10n.Cart.subtotal)
                    .font(.displaySmallerMedium)
                    .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                Spacer()
                Text(verbatim: "\(subtotal, formatter: currencyFormatter)")
                    .font(.displaySmallerBold)
                    .foregroundColor(Asset.Colors.gray20.swiftUIColor)
            }
            HStack {
                Text(L10n.Cart.taxes)
                    .font(.displaySmallerMedium)
                    .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                Spacer()
                Text(verbatim: "\(taxes, formatter: currencyFormatter)")
                    .font(.displaySmallerBold)
                    .foregroundColor(Asset.Colors.gray20.swiftUIColor)
            }
            HStack {
                Text(L10n.Cart.total)
                    .font(.displayLargerMedium)
                    .foregroundColor(Asset.Colors.black.swiftUIColor)
                Spacer()
                Text(verbatim: "\(total, formatter: currencyFormatter)")
                    .font(.displayLargerBold)
                    .foregroundColor(Asset.Colors.gray20.swiftUIColor)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(
            products: [.Stubs.smallCoffee, .Stubs.largeCoffee],
            subtotal: 16,
            taxes: 0.5,
            total: 16.5,
            currencyFormatter: .currencyFormatter()
        )
    }
}
