//
//  CartCheckoutComponent.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 19.12.23.
//

import SwiftUI

struct CheckoutCartView: View {
    @Binding var selectedProducts: [Product]
    @Binding var totalPrice: Double
    @Binding var isAlertPresented: Bool
    @Binding var alertMessage: String
    var onCheckout: () -> Void
    var onClear: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("My Cart")
                    .bold()
                    .font(.title)
                Image(systemName: "cart.fill")
                    .overlay(
                        Text(String(selectedProducts.count))
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .padding(4)
                            .background(Color.red)
                            .cornerRadius(10)
                            .offset(x: 15, y: -15)
                    )
                Spacer()
                Text("\(String(format: "%.2f", totalPrice)) $")
            }
            
            HStack {
                Button("Check Out") {
                    onCheckout()
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text(alertMessage))
                }
                Spacer()
                Button("Clear Cart") {
                    onClear()
                }
            }
        }
        .padding()
    }
    
}


