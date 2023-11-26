//
//  ProductsListViewModel.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import Foundation

protocol ProductsListViewModelDelegate: AnyObject {
    func productsFetched()
    func productsAmountChanged()
}

class ProductsListViewModel {

    weak var delegate: ProductsListViewModelDelegate?
    
    var products: [ProductModel]? 
    var totalPrice: Double? { products?.reduce(0) { $0 + $1.price * Double(($1.selectedAmount ?? 0))} }
    
    func viewDidLoad() {
        fetchProducts()
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] response in
            switch response {
            case .success(let products):
                self?.products = products
                self?.delegate?.productsFetched()
            case .failure(let error):
                print("Error fetching products: \(error.localizedDescription)")
            }
        }
    }
    
    //structs are value types. იქმნებოდა ახალი ინსტანსი. ამიტომ ამ ახალ ინსთენსს ჩვენს ერეიში მაგ ინდექსზე არსებულ ინსტანსად ვაქცევთ.
    
    func addProduct(at index: Int) {
        if var product = products?[index] {
            if product.stock > product.selectedAmount ?? 0 {
                product.selectedAmount = (product.selectedAmount ?? 0) + 1
                products?[index] = product
                delegate?.productsAmountChanged()
            }
        }
    }
    
    func removeProduct(at index: Int) {
        if var product = products?[index] {
            if product.selectedAmount ?? 0 > 0 {
                product.selectedAmount = (product.selectedAmount ?? 0) - 1
                products?[index] = product
                delegate?.productsAmountChanged()
            }
        }
    }
}
