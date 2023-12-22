//
//  PrimaveraView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct PrimaveraView: View {
    
    @EnvironmentObject var router: Router
    
    @State var userDidHold = false
    @State var rotationAngle = Angle.zero
    
    var body: some View {
        VStack (spacing: 30) {
            Text("Primavera - You can rotate, but you need hold first")
                .bold()
            if userDidHold {
                Text("Now, rotate the image")
                    .transition(.slide)
                    .font(.title)
                    .bold()
            }
            Image(.primavera)
                .resizable()
                .frame(width: 370, height: 250)
                .cornerRadius(10)
                .rotationEffect(rotationAngle)
                .gesture(
                    LongPressGesture(minimumDuration: 3)
                        .onEnded({ _ in
                            userDidHold = true
                        })
                )
                .simultaneousGesture(
                    RotationGesture()
                        .onChanged({ angle in
                            if userDidHold {
                                rotationAngle = angle
                            }
                        })
                )
        }
        .padding()
    }
}

#Preview {
    PrimaveraView()
}
