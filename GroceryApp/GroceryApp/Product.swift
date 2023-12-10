//
//  Product.swift
//  GroceryApp
//
//  Created by Nikoloz Gachechiladze on 10.12.23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    var selectedQuantity: Int
    var photoName: String
}
