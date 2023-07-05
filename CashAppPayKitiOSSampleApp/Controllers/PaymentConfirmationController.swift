//
//  PaymentConfirmationController.swift
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

import PayKit
import SwiftUI
import UIKit

protocol PaymentConfirmationControllerDelegate: AnyObject {
    func createCustomerRequest() -> CreateCustomerRequestParams
    func didFinishPayment(_ controller: PaymentConfirmationController, success: Bool)
}

final class PaymentConfirmationController: UIViewController {

    private lazy var sdk: CashAppPay = {
        let sdk = CashAppPay(clientID: CartViewController.sandboxClientID, endpoint: .sandbox)
        sdk.addObserver(self)
        return sdk
    }()

    weak var delegate: PaymentConfirmationControllerDelegate?

    private let viewModel = PaymentConfirmationView.ViewState(paymentMethod: "", isLoading: true)

    deinit {
        sdk.removeObserver(self)
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = Asset.Colors.background.color

        let controller = UIHostingController(rootView: PaymentConfirmationView(viewModel: self.viewModel))
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        controller.didMove(toParent: self)

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let delegate {
            sdk.createCustomerRequest(params: delegate.createCustomerRequest())
        }
    }

    private func updateViewState(isLoading: Bool) {
        viewModel.isLoading = isLoading
    }
}

extension PaymentConfirmationController: CashAppPayObserver {
    func stateDidChange(to state: CashAppPayState) {
        switch state {
        case .notStarted, .creatingCustomerRequest, .updatingCustomerRequest, .redirecting, .polling, .refreshing:
            break
        case .apiError, .integrationError, .networkError, .unexpectedError:
            break
        case .readyToAuthorize(let customerRequest):
            sdk.authorizeCustomerRequest(customerRequest)
        case .declined:
            self.updateViewState(isLoading: false)
            self.delegate?.didFinishPayment(self, success: false)
        case .approved(let request, _):
            self.updateViewState(isLoading: false)
            viewModel.paymentMethod = request.customerProfile?.cashtag ?? "Unknown"
            self.delegate?.didFinishPayment(self, success: true)
        }
    }
}
