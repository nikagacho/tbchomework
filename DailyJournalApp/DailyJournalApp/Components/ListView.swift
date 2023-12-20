//
//  ListView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct ListView: View {
    //MARK: - ViewModel
    @ObservedObject var viewModel: JournalViewModel
    @State private var editingNews: News?
    //MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.savedNews, id: \.self) { news in
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text(viewModel.formatDate(date: news.date))
                        Spacer()
                    }
                    HStack{
                        Text("Title: ")
                            .font(.system(size: 20))
                        Text(news.title)
                            .font(.system(size: 20))
                            .bold()
                    }
                    Text(news.newsText)
                        .font(.system(size: 14))
                }
            }
            .onDelete(perform: viewModel.removeNews)
            .onMove(perform: viewModel.moveNews)
        }
        .toolbar {
            Button("Sort by date") {
                viewModel.sortNewsByDate()
            }
            Button("Sort A-Z") {
                viewModel.sortNewsAlphabetically()
            }
            EditButton()
        }
        .overlay {
            if viewModel.savedNews.isEmpty {
                Text("Looks like there is no news :(")
                    .font(.title)
            }
            
        }
    }
}

