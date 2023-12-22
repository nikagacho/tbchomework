//
//  ListView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct ListView: View {
    // MARK: - ViewModel
    @ObservedObject var viewModel: JournalViewModel
    @State private var editingNews: News?
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.savedNews, id: \.self) { news in
                newsItemView(news)
            }
            .onDelete(perform: viewModel.removeNews)
            .onMove(perform: viewModel.moveNews)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                sortAndEditButtons
            }
        }
        .overlay {
            noNewsOverlay
        }
    }
    
    // MARK: - News Item
    private func newsItemView(_ news: News) -> some View {
        VStack(spacing: 20) {
            centeredText(viewModel.formatDate(date: news.date))
            HStack {
                Text("Title: ").font(.system(size: 20))
                Text(news.title).font(.system(size: 20)).bold()
            }
            Text(news.newsText).font(.system(size: 14))
        }
    }
    
    private func centeredText(_ text: String) -> some View {
        HStack {
            Spacer()
            Text(text)
            Spacer()
        }
    }
    
    // MARK: - Actins
    private var sortAndEditButtons: some View {
        HStack {
            Button("Sort by date", action: viewModel.sortNewsByDate)
            Button("Sort A-Z", action: viewModel.sortNewsAlphabetically)
            EditButton()
        }
    }
    
    // MARK: - Empty State
    private var noNewsOverlay: some View {
        Group {
            if viewModel.savedNews.isEmpty {
                Text("Looks like there is no news :(").font(.title)
            }
        }
    }
}
