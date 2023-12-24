//
//  ContentView.swift
//  ChristmasAnimations
//
//  Created by Nikoloz Gachechiladze on 24.12.23.
//

import SwiftUI

struct TextMovingView: View {
    
    @State private var scale = 1.0
    @State private var offsetSize = CGSize.zero
    @State private var colour: Color = .blue
    
    var body: some View {
        VStack {
            Text("TBC IT Academy")
                .font(.system(size: 24))
                .scaleEffect(scale)
                .offset(offsetSize)
                .foregroundColor(colour)
                .onAppear {
                    withAnimation(.easeInOut(duration:  2).repeatForever(autoreverses: true)) {
                        scale = 2
                        offsetSize = CGSize(width: 0, height: -50)
                        colour = .red
                    }
                }
            
        }
        .padding()
    }
}

#Preview {
    TextMovingView()
}
