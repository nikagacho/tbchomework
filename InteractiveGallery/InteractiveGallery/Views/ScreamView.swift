//
//  ScreamView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct ScreamView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var angle: Angle = .degrees(0.0)
    @State private var lastAngle: Angle = .degrees(0.0)
    
    var body: some View {
        VStack (spacing: 30) {
            Text("Rotate to explore, fix before leaving")
                .bold()
            Image(.scream)
                .resizable()
                .frame(width: 350, height: 450)
                .cornerRadius(10)
                .rotationEffect(angle)
                .gesture(
                    RotationGesture()
                        .onChanged({ newValue in
                            angle = lastAngle + newValue
                        })
                        .onEnded({ newValue in
                            lastAngle += newValue
                        })
                )
        }
        .padding()
        .navigationTitle("Scream")
    }
}

#Preview {
    ScreamView()
}
