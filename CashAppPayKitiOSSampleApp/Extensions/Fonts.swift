//
//  Fontbook.swift
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

extension UIFont {
    static let buttonTitleLarge = UIFont.systemFont(ofSize: 20, weight: .medium)
}

extension Font {
    static let brandIcon = Font.system(size: 38, weight: .regular)
    static let brand = Font.system(size: 30, weight: .regular)

    static let displayHeader = Font.system(size: 12, weight: .semibold)

    static let displayExtraSmallRegular = Font.system(size: 10, weight: .regular)
    static let displaySmallRegular = Font.system(size: 12, weight: .regular)
    static let displayMediumRegular = Font.system(size: 14, weight: .regular)
    static let displayLargeRegular = Font.system(size: 16, weight: .regular)
    static let displayExtraLargeRegular = Font.system(size: 20, weight: .regular)

    static let textField = Font.system(size: 14, weight: .regular)

    static let displaySmallerMedium = Font.system(size: 12, weight: .medium)
    static let displayLargerMedium = Font.system(size: 14, weight: .medium)
    static let displayExtraLargeMedium = Font.system(size: 18, weight: .medium)

    static let displaySmallerBold = Font.system(size: 12, weight: .bold)
    static let displayLargerBold = Font.system(size: 14, weight: .bold)
}
