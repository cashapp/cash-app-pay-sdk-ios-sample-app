//
//  ContactView.swift
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

struct ContactView: View {
    let name: String
    let email: String
    let phoneNumber: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.Vertical.small) {
            Text(L10n.Cart.contact)
                .font(.displayHeader)
                .foregroundColor(Asset.Colors.gray40.swiftUIColor)
                .padding(.bottom, Spacing.Vertical.small)
            TextField("", text: .constant(email))
                .font(.textField)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Asset.Colors.backgroundAccent.swiftUIColor))
                .foregroundColor(Asset.Colors.black70.swiftUIColor)
            TextField("", text: .constant(name))
                .font(.textField)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Asset.Colors.backgroundAccent.swiftUIColor))
                .foregroundColor(Asset.Colors.black70.swiftUIColor)
            TextField("", text: .constant(phoneNumber))
                .font(.textField)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Asset.Colors.backgroundAccent.swiftUIColor))
                .foregroundColor(Asset.Colors.black70.swiftUIColor)
            Text(L10n.Cart.Contact.details)
                .font(.displayExtraSmallRegular)
                .foregroundColor(Asset.Colors.black70.swiftUIColor)
                .lineSpacing(12)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(
            name: "Mark Mroz",
            email: "mmroz@squareup.com",
            phoneNumber: "+16139831908"
        )
    }
}
