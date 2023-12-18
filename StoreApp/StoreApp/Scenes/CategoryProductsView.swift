//
//  ProductsView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct CategoryProductsView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var category: String
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    private let columns = [
        GridItem(.flexible(minimum: 40), spacing: 50),
        GridItem(.flexible(minimum: 40), spacing: 50),
    ]
    
    var body: some View {
        VStack {
            BalanceView()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 50, content: {
                    ForEach(viewModel.allProducts.products, id: \.title) { product in
                        if category == product.category {
                            NavigationLink(destination: ProductDetailView( product: product)) {
                                ProductGridCardView(product: product)
                            }
                        }
                    }
                })
                
            }
            CheckoutCartView(
                selectedProducts: $viewModel.selectedProducts,
                totalPrice: $viewModel.totalPrice,
                isAlertPresented: $isAlertPresented,
                alertMessage: $alertMessage,
                onCheckout: initiateCheckout,
                onClear: {
                    viewModel.selectedProducts.removeAll()
                    viewModel.totalPrice = 0
                }
            )
        }
        .navigationTitle(category.uppercased())
        .padding()
    }
    
    private func initiateCheckout() {
        if viewModel.checkOut() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.completePurchase()
                alertMessage = "Payment Complete! Thank you for your purchase!"
                isAlertPresented = true
            }
        } else {
            alertMessage = "Not enough balance."
            isAlertPresented = true
        }
    }
}


