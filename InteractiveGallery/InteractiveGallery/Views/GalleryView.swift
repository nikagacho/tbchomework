//
//  ContentView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct GalleryView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to the Nikoloz Museum")
                .bold()
                .italic()
                .font(.title)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
            Text("You may enter the rooms below you by tapping on their names")
                .bold()
            Button("Guernica") {
                router.navigate(to: .guernica)
            }
            .modifier(ButtonModifier())
            Button("Death of Sardanapalus") {
                router.navigate(to: .delacroix)
            }
            .modifier(ButtonModifier())
            Button("Fisherman") {
                router.navigate(to: .fisherman)
            }
            .modifier(ButtonModifier())
            Button("Primavera") {
                router.navigate(to: .primavera)
            }
            .modifier(ButtonModifier())
            Button("Scream") {
                router.navigate(to: .scream)
            }
            .modifier(ButtonModifier())
        }
        .padding()
    }
}

#Preview {
    GalleryView()
}
