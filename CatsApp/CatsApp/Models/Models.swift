//
//  Models.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import Foundation

struct CatFactsResponse: Codable {
    let data: [CatFact]
}

struct CatFact: Codable {
    let fact: String
}

struct CatBreed: Codable {
    let data: [Breed]
}

struct Breed: Codable {
    let breed: String
    let country: String
}
