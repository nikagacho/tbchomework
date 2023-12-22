//
//  ButtonModifier.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 140)
            .background(Color.brown.opacity(0.4))
            .foregroundColor(.blue)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 2)
            )
    }
}
