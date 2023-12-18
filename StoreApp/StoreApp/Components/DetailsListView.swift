//
//  DetailsListView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 19.12.23.
//

import SwiftUI

struct DetailsListView: View {
    var product: Product
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Brand: ")
                    .bold()
                Spacer()
                Text(product.brand)
            }
            HStack {
                Text("Description: ")
                    .bold()
                Spacer()
                Text(product.description)
            }
            HStack {
                Text("Rating: ")
                    .bold()
                Spacer()
                Text("\(String(format: "%.2f", product.rating)) ⭐ ")
            }
            HStack {
                Text("Price: ")
                    .bold()
                Spacer()
                Text("\(String(format: "%.2f", product.price)) $")
            }
        }
    }
}
