//
//  LoadingSpinnerView.swift
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

struct LoadingSpinnerView: View {
    @State private var isRotating = 0.0

    private let gradient = AngularGradient(
        gradient: Gradient(colors: [Asset.Colors.green.swiftUIColor, Asset.Colors.white.swiftUIColor]),
        center: .center,
        startAngle: .degrees(270),
        endAngle: .degrees(.zero)
    )

    private var loadingIndicator: some View {
        ZStack {
            Circle().stroke(Color.white, lineWidth: Sizes.spinnerLineWidth)
            Circle()
                .trim(from: 0, to: CGFloat(0.8))
                .stroke(gradient, style: StrokeStyle(lineWidth: Sizes.spinnerLineWidth, lineCap: .round))
                .overlay(
                    Circle().trim(from: .zero, to: CGFloat(0.8))
                        .rotation(Angle.degrees(-4))
                        .stroke(gradient, style: StrokeStyle(lineWidth: Sizes.spinnerLineWidth, lineCap: .butt))
                )
        }
    }

    var body: some View {
        loadingIndicator
            .frame(width: Sizes.spinner)
            .rotationEffect(.degrees(isRotating))
            .onAppear {
                withAnimation(.linear(duration: 1)
                    .speed(0.8).repeatForever(autoreverses: false)) {
                        isRotating = 360.0
                    }
            }
    }
}

struct LoadingSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinnerView()
    }
}
