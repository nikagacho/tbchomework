//
//  Models.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import Foundation

struct City: Codable, Hashable {
    var name: String
    var generalInfo: String
    var imageName: String
    var transport: [String]
    var mustSee: [String]
    var hotels: [String]
}

struct Cities: Codable, Hashable {
    var cities: [City]
}

