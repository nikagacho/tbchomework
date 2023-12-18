//
//  TabBar.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CategoriesView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("Categories")
                }
        }
    }
}

#Preview {
    TabBar()
}
