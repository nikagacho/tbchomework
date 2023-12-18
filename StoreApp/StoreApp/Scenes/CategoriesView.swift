//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.categories, id: \.self) { category in
                NavigationLink(destination: CategoryProductsView(category: category)) {
                    HStack {
                        Text(viewModel.capitaliseFirstLetter(text: category))
                            .font(.system(size: 24))
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                }
            }
            .navigationTitle("Categories")
            .onAppear() {
                viewModel.getCategories()
            }
        }
    }
}
