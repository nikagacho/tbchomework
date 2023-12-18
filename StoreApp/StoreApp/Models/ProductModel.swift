//
//  ProductModel.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import Foundation

struct Product: Codable, Identifiable, Hashable{
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

struct ProductList: Codable {
    let products: [Product]
}

