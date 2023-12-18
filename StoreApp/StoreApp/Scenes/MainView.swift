//
//  ContentView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var path: [Product] = []
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    @State private var showingSheet = false
    private let columns = [
        GridItem(.flexible(minimum: 40), spacing: 50),
        GridItem(.flexible(minimum: 40), spacing: 50),
    ]
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("ShopStoreMarket")
                        .bold()
                        .font(.largeTitle)
                    Image(systemName: "globe.europe.africa.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .onAppear() {
                    viewModel.fetchProducts()
                }
                BalanceView()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 50, content: {
                        ForEach(viewModel.allProducts.products, id: \.title) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductGridCardView(product: product)
                            }                        }
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
            .padding()
            
        }
        
    }
    private func initiateCheckout() {
        if viewModel.checkOut() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.completePurchase()
                alertMessage = "Payment Complete! Thank you for your purchase!"
                isAlertPresented = true
            }
        } else {
            alertMessage = "Not enough balance, please remove items from your cart."
            isAlertPresented = true
        }
    }
}


#Preview {
    MainView()
}
