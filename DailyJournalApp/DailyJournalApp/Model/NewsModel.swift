//
//  NewsModel.swift
//  DailyJournalApp
//
//  Created by Nikoloz Gachechiladze on 20.12.23.
//

import Foundation

struct News: Hashable {
    let id = UUID()
    var title: String
    var newsText: String
    var date: Date
}
