//
//  Product.swift
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

struct Product: Hashable {
    let name: String
    let variant: String
    let price: Decimal
    let description: String
    let fullName: String
    let icon: UIImage
}

extension Product {
    enum Stubs {
        static let smallCoffee: Product = Product(
            name: "Coffee",
            variant: "Small (8oz)",
            price: 7,
            description:
                "16 oz serving of iced rishi jasmine green tea this tea"
            + " comes unsweetened but we can sweeten it for you at pick-up!",
            fullName: "Small Coffee (8oz)",
            icon: Asset.Images.coffee.image
        )
        static let largeCoffee: Product = Product(
            name: "Coffee",
            variant: "Large (16oz)",
            price: 9,
            description:
                "32 oz serving of iced rishi jasmine green tea"
            + " this tea comes unsweetened but we can sweeten it for you at pick-up!",
            fullName: "Large Coffee (16oz)",
            icon: Asset.Images.coffee.image
        )
    }
}
