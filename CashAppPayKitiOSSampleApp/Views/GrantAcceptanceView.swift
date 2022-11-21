//
//  GrantAcceptanceView.swift
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

struct GrantAcceptanceView: View {

    let merchantName: String

    var body: some View {
        VStack {
            VStack(spacing: Spacing.Vertical.small) {
                LogoView()
                    .frame(width: Sizes.iconLarge, height: Sizes.iconLarge)
                Text(merchantName)
                    .font(.displayExtraLargeMedium)
                    .foregroundColor(Asset.Colors.gray20.swiftUIColor)
                    .bold()
                Text(L10n.GrantAcceptance.orderInProgress)
                    .font(.displayLargeRegular)
                    .foregroundColor(Asset.Colors.gray40.swiftUIColor)
            }
            Spacer()

            Text(L10n.GrantAcceptance.continueOrder(merchantName))
                    .font(.displayLargeRegular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                    .frame(maxWidth: .infinity, maxHeight: 96)
                    .overlay(
                        RoundedRectangle(cornerRadius: Sizes.cornerRadiusExtraRound)
                            .stroke(Asset.Colors.border.swiftUIColor, lineWidth: Sizes.borderWidth)
                    )
        }.padding([.leading, .trailing], Spacing.Horizontal.large)
    }
}

struct GrantAcceptanceView_Previews: PreviewProvider {
    static var previews: some View {
        GrantAcceptanceView(merchantName: "Good Pour Coffee")
    }
}
