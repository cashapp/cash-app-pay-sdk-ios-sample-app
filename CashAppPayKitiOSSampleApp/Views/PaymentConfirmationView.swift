//
//  PaymentConfirmationView.swift
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

import PayKitUI
import SwiftUI

struct PaymentConfirmationView: View {

    @StateObject var viewModel: ViewState

    private var successView: some View {
        VStack(spacing: Spacing.Vertical.large) {
            Image(systemName: "checkmark.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(Asset.Colors.white.swiftUIColor, Asset.Colors.green.swiftUIColor)
                .font(.system(size: 60))
            CashAppPaymentMethodView(cashTag: viewModel.paymentMethod)
        }
    }

    var body: some View {
        VStack {
            Spacer()
            if viewModel.isLoading {
                LoadingSpinnerView()
            } else {
                successView
            }
            Spacer()
        }
    }
}

extension PaymentConfirmationView {
    final class ViewState: ObservableObject {
        var paymentMethod: String
        @Published var isLoading: Bool

        init(paymentMethod: String, isLoading: Bool) {
            self.paymentMethod = paymentMethod
            self.isLoading = isLoading
        }
    }
}

struct PaymentConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PaymentConfirmationView(viewModel: .init(paymentMethod: "$jack", isLoading: true))
            PaymentConfirmationView(viewModel: .init(paymentMethod: "$jack", isLoading: false))
        }

    }
}
