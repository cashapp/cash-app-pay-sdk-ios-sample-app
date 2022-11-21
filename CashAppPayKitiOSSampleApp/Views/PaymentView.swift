//
//  PaymentView.swift
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

struct PaymentView: View {
    let cashTag: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Vertical.small) {
            Text(L10n.Cart.payment)
                .font(.displayHeader)
                .foregroundColor(Asset.Colors.gray40.swiftUIColor)
            Text(L10n.Cart.Payment.subtitle)
                .font(.displaySmallRegular)
                .foregroundColor(Asset.Colors.black70.swiftUIColor)
                .padding(.bottom, Spacing.Vertical.minimum)
            HStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: Sizes.smallIcon, height: Sizes.smallIcon)
                    .foregroundColor(Asset.Colors.green.swiftUIColor)
                    .overlay(Asset.Images.dollarSign.swiftUIImage.foregroundColor(.white))
                Text(L10n.Cart.Payment.cashAppPay)
                    .font(.displayLargerMedium)
                    .foregroundColor(Asset.Colors.black.swiftUIColor)
                Spacer()
                Text(cashTag)
                    .font(.displayMediumRegular)
                    .foregroundColor(Asset.Colors.gray60.swiftUIColor)
            }.padding([.top, .bottom], Spacing.Vertical.large)
            HStack(spacing: Spacing.Horizontal.small) {
                Asset.Images.card.swiftUIImage
                    .frame(width: Sizes.cardIconWidth, height: Sizes.cardIconHeight)
                    .foregroundColor(Asset.Colors.teal.swiftUIColor)
                Text(L10n.Cart.Payment.payLater)
                    .font(.displayMediumRegular)
                    .foregroundColor(Asset.Colors.black70.swiftUIColor)
            }
            HStack(spacing: Spacing.Horizontal.small) {
                Asset.Images.card.swiftUIImage
                    .frame(width: Sizes.cardIconWidth, height: Sizes.cardIconHeight)
                    .foregroundColor(Asset.Colors.gray.swiftUIColor)
                Text(L10n.Cart.Payment.addCard)
                    .font(.displayMediumRegular)
                    .foregroundColor(Asset.Colors.black70.swiftUIColor)
            }
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(
            cashTag: "$jack"
        )
    }
}
