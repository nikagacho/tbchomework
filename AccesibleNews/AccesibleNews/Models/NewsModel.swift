//
//  NewsModel.swift
//  AccesibleNews
//
//  Created by Nikoloz Gachechiladze on 27.12.23.
//

import Foundation

struct NewsResponse: Codable {
    let data: [NewsArticle]
}

struct NewsArticle : Codable {
    let title: String
    let description: String?
}
