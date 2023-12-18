//
//  ProductGridCardView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct ProductGridCardView: View {
    
    var product: Product
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .background(Color.white)
                .border(Color.gray)
            VStack {
                Text(product.title)
                    .bold()
                    .font(.system(size: 21))
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                        .frame(width: 50, height: 80)
                } placeholder: {
                    ProgressView()
                }
                
                Text("Price: " + String(format: "%.2f",product.price) + "$")
                Button("Add To Cart") {
                    viewModel.addToCart(product: product)
                }
            }
        }
    }
}
