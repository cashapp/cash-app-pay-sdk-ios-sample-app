//
//  NumberFormatter+Currency.swift
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

import Foundation

extension NumberFormatter {
    static func currencyFormatter(locale: Locale = .autoupdatingCurrent) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Decimal, formatter: NumberFormatter) {
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
}
