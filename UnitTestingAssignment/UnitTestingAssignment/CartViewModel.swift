//
//  CartViewModel.swift
//  UnitTestingAssignment
//
//  Created by Baramidze on 02.12.23.
//

import Foundation

final class CartViewModel {
    
    var allProducts: [Product]?
    
    var selectedProducts = [Product]()
    
    var selectedItemsQuantity: Int? {
        selectedProducts.reduce(0) { $0 + ($1.selectedQuantity ?? 0) }
    }
    
    var totalPrice: Double? {
        selectedProducts.reduce(0.0) { $0 + Double($1.selectedQuantity ?? 0) * ($1.price ?? 0)  }
    }
    
    func viewDidLoad() {
        fetchProducts()
    }
    
    func fetchProducts() {
        
//        self?.allproducts = ProductsResponse.dummyProducts

        NetworkManager.shared.fetchProducts(completion: { [weak self] products in
            switch products {
            case .success(let products):
                self?.allProducts = products
            case .failure(_):
                break
            }
        })
    }
    
    func addProduct(withID: Int?) {
        if let productForAdd = allProducts?.first(where: { $0.id == withID }) {
            addProduct(product: productForAdd)
        }
    }
    
    //ორიგინალ ფუნქციაში არსად არ ხდებოდა selectedQuantity-ის გაზრდა (მგონი), ამიტო ეს ფუნქცია ცოტა გადავაკეთე და ჩემი ტესტი ახლა საქსესშია.
    //არვიცი რამდენად ჩემი ტესტი იყო არასწორი, თუ ლოგიკა იყო არასწორად.
    
    func addProduct(product: Product?) {
        guard let product = product else { return }
        
        if let index = selectedProducts.firstIndex(where: { $0.id == product.id }) {
            selectedProducts[index].selectedQuantity! += 1
        } else {
            let newProduct = product
            newProduct.selectedQuantity = 1
            selectedProducts.append(newProduct)
        }
    }

    
    func addRandomProduct() {
        addProduct(product: allProducts?.randomElement())
    }
    
    func removeProduct(withID: Int) {
        selectedProducts.removeAll(where: { $0.id == withID })
    }
    
    func clearCart() {
        selectedProducts.removeAll()
    }
}
