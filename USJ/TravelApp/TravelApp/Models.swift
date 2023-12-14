//
//  Models.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import Foundation

struct City: Hashable {
    let name: String
    let generalInfo: String
    let imageName: String
    let transport: [String]
    let mustSee: [String]
    let hotels: [String]
}
