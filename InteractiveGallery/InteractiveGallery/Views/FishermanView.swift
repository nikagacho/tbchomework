//
//  FishermanView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct FishermanView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var currentValue = CGFloat.zero
    @State private var lastValue = CGFloat.zero
    var body: some View {
        VStack {
            Text("Zoom in to enjoy it fully")
                .bold()
            Image(.fisherman)
                .resizable()
                .frame(width: 350, height: 400)
                .cornerRadius(10)
                .scaleEffect(currentValue + 1)
                .gesture(
                    MagnifyGesture()
                        .onChanged({ value in
                            currentValue = lastValue + (value.magnification - 1)
                        })
                        .onEnded({ value in
                            lastValue += value.magnification - 1
                        })
                )
        }
        .navigationTitle("Fisherman")
    }
}

#Preview {
    FishermanView()
}
