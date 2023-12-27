//
//  ContentView.swift
//  AccesibleNews
//
//  Created by Nikoloz Gachechiladze on 27.12.23.
//

import SwiftUI

struct NewsView: View {
    //MARK: ViewModel
    @ObservedObject var viewModel: NewsViewModel
    //MARK: - Body
    var body: some View {
        VStack {
            Text("Accessible News")
                .fontWeight(.heavy)
                .accessibilityAddTraits(.isHeader)
            TableView(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    NewsView(viewModel: NewsViewModel())
}
