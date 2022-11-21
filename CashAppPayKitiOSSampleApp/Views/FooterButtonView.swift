//
//  FooterButtonView.swift
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

import UIKit

protocol FooterButtonDelegate: AnyObject {
    func didSelect()
}

final class FooterButtonView: UIView {

    var buttonColor: UIColor? {
        get { button.backgroundColor }
        set { button.backgroundColor = newValue }
    }

    private lazy var button: UIButton = {
        let button = UIButton(primaryAction: UIAction { [weak self] _ in
            self?.delegate?.didSelect()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()

    weak var delegate: FooterButtonDelegate?

    var title: NSAttributedString? {
        get { button.titleLabel?.attributedText }
        set { button.setAttributedTitle(newValue, for: .normal) }
    }

    init() {
        super.init(frame: .zero)

        button.backgroundColor = Asset.Colors.black.color

        addSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: Sizes.button),

            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.Horizontal.large),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.Horizontal.large),
            button.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.Vertical.large),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.Vertical.medium),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        button.layer.cornerRadius = button.layer.frame.height / 2
    }
}
