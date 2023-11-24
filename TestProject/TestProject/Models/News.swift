//
//  News.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation
// დეკოდაბლ უნდა იყოს ესეც თორე არტიკლ ვეღარ იყო დეკოდაბლ
struct News: Decodable {
    let authors: String?
    let title: String?
    let urlToImage: String?
}
