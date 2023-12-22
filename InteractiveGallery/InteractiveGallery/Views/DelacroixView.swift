//
//  DelacroixView.swift
//  InteractiveGallery
//
//  Created by Nikoloz Gachechiladze on 22.12.23.
//

import SwiftUI

struct DelacroixView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var isAlertShown = false
    var body: some View {
        VStack(spacing: 30) {
            Text("Hold the image to learn more")
                .bold()
            Image(.delacroix)
                .resizable()
                .frame(width: 370, height: 300)
                .cornerRadius(10)
                .onLongPressGesture {
                    isAlertShown = true
                }
                .alert(isPresented: $isAlertShown, content: {
                    Alert(title: Text("The death of Sardanapalus"), message: Text("This is an oil painting canvas by French artist Eugene Delacroix, dated 1827. It currently hangs in Louvre Museum, Paris."))
                })
        }
        .navigationTitle("Death of Sardanapalus")
    }
}

#Preview {
    DelacroixView()
}
