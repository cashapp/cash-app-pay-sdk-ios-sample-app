//
//  ProductDetailsViewController.swift
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
import UIKit

final class ProductDetailsViewController: UIViewController {

    private let product: Product
    private let currencyFormatter: NumberFormatter

    init(product: Product, currencyFormatter: NumberFormatter = .currencyFormatter()) {
        self.product = product
        self.currencyFormatter = currencyFormatter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = Asset.Colors.background.color

        let controller = makeContentController()
        let footerButton = makeFooterButtonView()

        view.addSubview(controller.view)
        view.addSubview(footerButton)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        controller.didMove(toParent: self)

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
}

// MARK: - FooterButtonDelegate

extension ProductDetailsViewController: FooterButtonDelegate {
    func didSelect() {
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
}

// MARK: - View Building

private extension ProductDetailsViewController {

    func setNavigationBar() {
        navigationItem.titleView = makeNavigationTitleView()
        navigationItem.setRightBarButton(makeCartButton(), animated: false)
    }

    func makeNavigationTitleView() -> UIView? {
        let titleView = UIHostingController(rootView: NavigationTitleView()).view
        titleView?.backgroundColor = .clear
        return titleView
    }

    func makeCartButton() -> UIBarButtonItem {
        var imageConfig = UIImage.SymbolConfiguration(paletteColors: [Asset.Colors.brand.color])
        imageConfig = imageConfig.applying(UIImage.SymbolConfiguration(scale: .small))
        let cartImage = UIImage(systemName: "cart", withConfiguration: imageConfig)

        let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: Sizes.barButton, height: Sizes.barButton))
        rightBarButton.setImage(cartImage, for: .normal)
        rightBarButton.layer.cornerRadius = Sizes.barButton / 2
        rightBarButton.backgroundColor = Asset.Colors.backgroundPrimary.color
        return UIBarButtonItem(customView: rightBarButton)
    }

    func makeContentController() -> UIHostingController<ProductDetailsView> {
        let controller = UIHostingController(
            rootView: ProductDetailsView(product: product, currencyFormatter: currencyFormatter)
        )
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }

    func makeFooterButtonView() -> FooterButtonView {
        let footer = FooterButtonView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.title = NSAttributedString(
            string: L10n.addToCart,
            font: .buttonTitleLarge,
            color: Asset.Colors.white.color
        )
        footer.delegate = self
        return footer
    }
}
