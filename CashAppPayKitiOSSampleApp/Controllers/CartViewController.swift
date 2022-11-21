//
//  CartViewController.swift
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
import PayKitUI
import SwiftUI
import UIKit

final class CartViewController: UIViewController {
    private let currencyFormatter: NumberFormatter = .currencyFormatter()
    private lazy var dataSource: UITableViewDiffableDataSource<Section, SectionItem> = makeDataSource()
    private lazy var tableView = makeTableView()
    private lazy var footerButton = makeFooterButtonView()

    private var state = ViewState() {
        didSet {
            updateViewState()
        }
    }

    static let sandboxBrandID = "BRAND_9t4pg7c16v4lukc98bm9jxyse"
    static let sandboxClientID = "CAS-CI_PAYKIT_MOBILE_DEMO"

    override func loadView() {
        let view = UIView()
        view.addSubview(tableView)
        view.addSubview(footerButton)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            footerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitleView()
        state = ViewState(
            products: [Product.Stubs.smallCoffee],
            email: "customer@email.com",
            phoneNumber: "+16139831908",
            name: "Customer Doe",
            cashTag: "$jack"
        )
    }

    private func updateViewState() {
        var snapshot = dataSource.snapshot()
        snapshot.deleteAllItems()

        if !state.products.isEmpty {
            snapshot.appendSections([.checkout])
            snapshot.appendItems([
                .cart(state.products, subtotal: state.subtotal, taxes: state.taxes, total: state.total)
            ], toSection: .checkout)
        }

        snapshot.appendSections([.customer])
        snapshot.appendItems([
            .contact(email: state.email, name: state.name, phoneNumber: state.phoneNumber)
        ], toSection: .customer)

        snapshot.appendSections([.payment])
        snapshot.appendItems([.payment(cashTag: state.cashTag)], toSection: .payment)

        dataSource.apply(snapshot)
    }
}

extension CartViewController {
    struct ViewState {
        private let taxRate: Decimal = 0.15
        var products: [Product]

        var subtotal: Decimal {
            products.map(\.price).reduce(0, +)
        }

        var taxes: Decimal {
            subtotal * taxRate
        }

        var total: Decimal {
            subtotal + taxes
        }

        var totalInCents: UInt {
            NSDecimalNumber(decimal: total * 100.0).uintValue
        }

        var email: String
        var phoneNumber: String
        var name: String
        var cashTag: String

        init(products: [Product] = [],
             email: String = "",
             phoneNumber: String = "",
             name: String = "",
             cashTag: String = "") {
            self.products = products
            self.email = email
            self.phoneNumber = phoneNumber
            self.name = name
            self.cashTag = cashTag
        }

        var createOneTimePayment: CreateCustomerRequestParams {
            CreateCustomerRequestParams(
                actions: [
                    .oneTimePayment(
                        scopeID: CartViewController.sandboxClientID, money: Money(amount: totalInCents, currency: .USD)
                    ),
                ],
                channel: .IN_APP,
                redirectURL: URL(string: "CashAppPayKitiOSSampleApp://callback")!,
                referenceID: nil,
                metadata: nil
            )
        }
    }
}

// MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

// MARK: - FooterButtonDelegate

extension CartViewController: FooterButtonDelegate {
    func didSelect() {
        let controller = PaymentConfirmationController()
        controller.delegate = self
        present(controller, animated: true)
    }
}

// MARK: - View Building

private extension CartViewController {
    func setNavigationTitleView() {
        guard let titleView = UIHostingController(rootView: NavigationTitleView()).view else {
            return
        }
        titleView.backgroundColor = .clear
        navigationItem.titleView = titleView
    }

    func makeFooterButtonView() -> CashAppPayButton {
        let checkoutButton = CashAppPayButton { [weak self] in
            guard let self else { return }
            self.didSelect()

        }

        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        return checkoutButton
    }

    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = Asset.Colors.background.color
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(
            top: .zero,
            left: .zero,
            bottom: Spacing.Vertical.extraLarge,
            right: .zero
        )
        tableView.sectionFooterHeight = .zero
        tableView.delegate = self
        return tableView
    }
}

// MARK: - DataSource

extension CartViewController {
    enum Section {
        case checkout
        case customer
        case payment
    }

    enum SectionItem: Hashable {
        case cart([Product], subtotal: Decimal, taxes: Decimal, total: Decimal)
        case contact(email: String, name: String, phoneNumber: String)
        case payment(cashTag: String)
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Section, SectionItem> {
        UITableViewDiffableDataSource(tableView: tableView) { [weak self] _, _, itemIdentifier in
            let cell = UITableViewCell()
            guard let self else { return cell }
            switch itemIdentifier {
            case .cart(let products, subtotal: let subtotal, taxes: let taxes, total: let total):
                cell.contentConfiguration = UIHostingConfiguration {
                    CartView(
                        products: products,
                        subtotal: subtotal,
                        taxes: taxes,
                        total: total,
                        currencyFormatter: self.currencyFormatter
                    )
                }
                cell.backgroundColor = .clear
            case .contact(email: let email, name: let name, phoneNumber: let phoneNumber):
                cell.contentConfiguration = UIHostingConfiguration {
                    ContactView(name: name, email: email, phoneNumber: phoneNumber)
                }
            case .payment(cashTag: let cashTag):
                cell.contentConfiguration = UIHostingConfiguration {
                    PaymentView(cashTag: cashTag)
                }
            }
            return cell
        }
    }
}

extension CartViewController: PaymentConfirmationControllerDelegate {
    func createCustomerRequest() -> CreateCustomerRequestParams {
        state.createOneTimePayment
    }
    func didFinishPayment(_ controller: PaymentConfirmationController, success: Bool) {
        self.navigationController?.pushViewController(GrantAcceptanceViewController(), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dismiss(animated: true)
        }
    }
}
