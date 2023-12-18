//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import Foundation
import NetworkLayerPackage

enum CheckoutAlert {
    case none
    case success
    case failure
}

final class MainViewModel: ObservableObject {
    private let networkManager = NetworkManager<ProductList>()
    @Published var balance: Double = 10000
    @Published var totalPrice: Double = 0
    @Published var allProducts: ProductList = ProductList(products: [])
    @Published var selectedProducts: [Product] = []
    @Published var categories: [String] = []
    
    func addToCart(product: Product) {
        selectedProducts.append(product)
        totalPrice += product.price
    }
    
    func checkOut() -> Bool {
        if balance >= totalPrice {
            return true
        } else {
            return false
        }
    }
    
    func completePurchase() {
        balance -= totalPrice
        selectedProducts = []
        totalPrice = 0
    }
    
    func getCategories() {
        let allCategories = Set(allProducts.products.map { $0.category })
        categories = Array(allCategories).sorted()
    }
    
    func fetchProducts() {
        let url = "https://dummyjson.com/products"
        
        Task {
            do {
                let updatedProducts = try await networkManager.fetchData(from: url)
                DispatchQueue.main.async {
                    self.allProducts = updatedProducts
                }
            } catch {
                print("Error fetching products: \(error)")
            }
            
        }
        
        
    }
    
    func capitaliseFirstLetter(text: String) -> String {
        guard let firstLetter = text.first else {
            return text
        }
        let capitalisedFirstLetter = String(firstLetter).capitalized
        let restOfTheString = String(text.dropFirst())
        return capitalisedFirstLetter + restOfTheString
    }
}
