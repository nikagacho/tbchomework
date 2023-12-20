//
//  EditView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct NewsEditView: View {
    @ObservedObject var viewModel: JournalViewModel
    var news: News

    @State private var editedTitle: String
    @State private var editedText: String
    @State private var editedDate: Date

    init(viewModel: JournalViewModel, news: News) {
        self.viewModel = viewModel
        self.news = news
        _editedTitle = State(initialValue: news.title)
        _editedText = State(initialValue: news.newsText)
        _editedDate = State(initialValue: news.date)
    }

    var body: some View {
        Form {
            TextField("Title", text: $editedTitle)
            TextField("News Text", text: $editedText)
            DatePicker("Date", selection: $editedDate)
            Button("Save") {
                let updatedNews = News(title: editedTitle, newsText: editedText, date: editedDate)
                viewModel.editNews(updatedNews)
            }
        }
    }
}


