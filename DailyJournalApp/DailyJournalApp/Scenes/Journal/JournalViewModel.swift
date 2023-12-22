//
//  JournalViewModel.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import Foundation

final class JournalViewModel: ObservableObject {
    // MARK: - Properties
    @Published var title = ""
    @Published var newsText = ""
    @Published var date: Date = Date()
    @Published var savedNews: [News] = []
    
    // MARK: - Methods
    func createNews() {
        guard !title.isEmpty else { return }
        let createdNews = News(title: title, newsText: newsText, date: date)
        savedNews.append(createdNews)
        resetTextFields()
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    func removeNews(at offsets: IndexSet) {
        savedNews.remove(atOffsets: offsets)
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        savedNews.move(fromOffsets: source, toOffset: destination)
    }
    
    func sortNewsByDate() {
        savedNews.sort { $0.date > $1.date }
    }
    
    func sortNewsAlphabetically() {
        savedNews.sort { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
    }
    
    private func resetTextFields() {
        title = ""
        newsText = ""
        date = Date()
    }
}
