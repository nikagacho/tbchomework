//
//  Models.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 19.11.23.
//

import Foundation

struct newMovie: Codable {
    let title: String
    let overview: String
    let release_date: String
    let runtime: Int
    let budget: Int
    let vote_average: Double
    let revenue: Int
    let poster_path: String?
}
