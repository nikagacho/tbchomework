//
//  FormView.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import SwiftUI

struct FormView: View {
    // MARK: - ViewModel
    @ObservedObject var viewModel: JournalViewModel
    
    // MARK: - Body
    var body: some View {
        Form {
            TextField("Title", text: $viewModel.title)
            TextField("News", text: $viewModel.newsText, axis: .vertical)
                .lineLimit(6)
            DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
            Button("Save News") {
                viewModel.createNews()
            }
        }
    }
}



