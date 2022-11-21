//
//  Metrics.swift
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

enum Spacing {
    enum Horizontal {
        /// 12px
        static let small: CGFloat = 12
        /// 28px
        static let large: CGFloat = 28
    }

    enum Vertical {
        /// 4px
        static let halfPoint: CGFloat = 4
        /// 8px
        static let minimum: CGFloat = 8
        /// 12px
        static let small: CGFloat = 12
        /// 16px
        static let medium: CGFloat = 16
        /// 24px
        static let large: CGFloat = 24
        /// 64px
        static let extraLarge: CGFloat = 64
    }
}
