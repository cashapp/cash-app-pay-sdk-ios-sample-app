//
//  GrantAcceptanceViewController.swift
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

final class GrantAcceptanceViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = Asset.Colors.white.color

        let controller = makeContentController()
        let footerButton = makeFooterButtonView()

        view.addSubview(controller.view)
        view.addSubview(footerButton)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(
                equalTo: footerButton.topAnchor,
                constant: -Spacing.Vertical.medium
            ),
            footerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        controller.didMove(toParent: self)

        self.view = view
    }
}

// MARK: - FooterButtonDelegate

extension GrantAcceptanceViewController: FooterButtonDelegate {
    func didSelect() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - View Building

private extension GrantAcceptanceViewController {

    func makeContentController() -> UIHostingController<GrantAcceptanceView> {
        let controller = UIHostingController(rootView: GrantAcceptanceView(merchantName: "Good Pour Coffee"))
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }

    func makeFooterButtonView() -> FooterButtonView {
        let footer = FooterButtonView()
        footer.buttonColor = Asset.Colors.green.color
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.title = NSAttributedString(
            string: L10n.continueToCheckout,
            font: .buttonTitleLarge,
            color: Asset.Colors.white.color
        )
        footer.delegate = self
        return footer
    }
}
