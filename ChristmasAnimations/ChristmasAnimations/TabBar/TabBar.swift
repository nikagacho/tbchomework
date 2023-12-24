//
//  TabBar.swift
//  ChristmasAnimations
//
//  Created by Nikoloz Gachechiladze on 24.12.23.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            TextMovingView()
                .tabItem {
                    Image(systemName: "note")
                    Text("Home")
                }
            ChristmasTreeView()
                .tabItem {
                    Image(systemName: "tree")
                    Text("Christmas Tree")
                }
        }
    }
}

#Preview {
    TabBar()
}
