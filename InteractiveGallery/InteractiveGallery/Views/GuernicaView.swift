//
//  GuernicaView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct GuernicaView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var dragOffset = CGSize.zero
    @State private var endDragOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 40){
            Text("Drag, but you can't steal :)")
                .bold()
            
            Image("guernica")
                .resizable()
                .frame(width: 350, height: 250)
                .cornerRadius(10)
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            dragOffset = value.translation
                        })
                        .onEnded({ value in
                            endDragOffset.width += dragOffset.width
                            endDragOffset.height += dragOffset.height
                            dragOffset = .zero
                        })
                )
            
        }
        .padding()
        .navigationTitle("Guernica")
        
    }
}


#Preview {
    GuernicaView()
}
