//
//  ContentView.swift
//  GroceryApp
//
//  Created by Nikoloz Gachechiladze on 10.12.23.
//

import SwiftUI


struct ContentView: View {
    //MARK: - ViewModel
    @ObservedObject private var viewModel = GroceryAppViewModel()
    //MARK: - View
    var body: some View {
        VStack {
            HStack {
                Text("სამი ნაბიჯი")
                    .bold()
                    .font(.title)
                Spacer()
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Spacer()
            List {
                ForEach(viewModel.allProducts) { product in
                    ProductView(product: product, viewModel: viewModel)
                        .frame(height: 60)
                }
            }
            Text("Total: " + String(format: "%.2f",viewModel.totalPrice) + " ₾")
        }
        .padding()
    }
}

struct ProductView: View {
    //MARK: - Viewmodel and parameter
    var product: Product
    
    @ObservedObject var viewModel: GroceryAppViewModel
    //MARK: - Body
    var body: some View {
        HStack {
            Text("\(product.name)")
                .font(.system(size: 20))
            Text("₾" + String(format: "%.2f", product.price))
            Image(product.photoName)
                .resizable()
                .frame(width: 30, height: 30)
            Spacer()
            if let selectedProduct = viewModel.selectedProducts.first(where: { $0.id == product.id }) {
                Text("\(selectedProduct.selectedQuantity)")
            } else {
                Text("0")
            }
            Button(action: {
                viewModel.addProduct(product: product)
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
            .buttonStyle(BorderlessButtonStyle())
            Button(action: {
                viewModel.removeProduct(product: product)
            }) {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
    }
}

#Preview {
    ContentView()
}

