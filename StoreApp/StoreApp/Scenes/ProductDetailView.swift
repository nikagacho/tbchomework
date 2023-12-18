//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
            VStack(alignment: .leading, spacing: 25) {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 15) {
                        ForEach(product.images, id: \.self) { image in
                            AsyncImage(url: URL(string: image)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    
                }
                DetailsListView(product: product)
            }
            .padding()
            .navigationBarTitle("Product Details", displayMode: .inline)
        }
    
}

