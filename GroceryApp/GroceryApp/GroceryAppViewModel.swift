//
//  ViewModel.swift
//  GroceryApp
//
//  Created by Nikoloz Gachechiladze on 10.12.23.
//

import Foundation

final class GroceryAppViewModel: ObservableObject {
    
    @Published var allProducts: [Product] = [
        Product(name: "Bread", price: 1.40, selectedQuantity: 0, photoName: "bread"),
        Product(name: "Butter", price: 4.30, selectedQuantity: 0, photoName: "butter"),
        Product(name: "Milk", price: 3.20, selectedQuantity: 0, photoName: "milk"),
        Product(name: "Nutella", price: 11.99, selectedQuantity: 0, photoName: "nutela"),
        Product(name: "Egg", price: 8.20, selectedQuantity: 0, photoName: "egg"),
        Product(name: "CocaCola", price: 1.79, selectedQuantity: 0, photoName: "cola"),
        Product(name: "Olive Oil", price: 10.99, selectedQuantity: 0, photoName: "oil"),
        Product(name: "Cheese", price: 9.99, selectedQuantity: 0, photoName: "cheese"),
        Product(name: "Snickers", price: 2.39, selectedQuantity: 0, photoName: "snickers"),
        Product(name: "Cigarette", price: 7.99, selectedQuantity: 0, photoName: "cigarette")
    ]
    
    @Published var selectedProducts: [Product] = []
    
    var totalPrice: Double {
        selectedProducts.reduce(0.0) { $0 + Double($1.selectedQuantity) * $1.price }
    }
    
    func addProduct(product: Product) {
        if let index = selectedProducts.firstIndex(where: { $0.id == product.id }) {
            print("already there, quantity updated")
            var updatedProduct = selectedProducts[index]
            updatedProduct.selectedQuantity += 1
            selectedProducts[index] = updatedProduct
        } else {
            if let indexInAllProducts = allProducts.firstIndex(where: { $0.id == product.id }) {
                print("new product added, quantity 1")
                var newProduct = allProducts[indexInAllProducts]
                newProduct.selectedQuantity = 1
                selectedProducts.append(newProduct)
            }
        }
    }
    
    
    func removeProduct(product: Product) {
        if let index = selectedProducts.firstIndex(where: { $0.id == product.id }) {
            if selectedProducts[index].selectedQuantity > 1 {
                selectedProducts[index].selectedQuantity -= 1
            } else if selectedProducts[index].selectedQuantity == 1 {
                selectedProducts.remove(at: index)
                print("Product removed from the selected list")
            }
        }
        
    }
    
    
    
}
