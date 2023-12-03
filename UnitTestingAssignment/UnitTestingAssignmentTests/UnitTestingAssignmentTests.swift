//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Nikoloz Gachechiladze on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var cart: CartViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        cart = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cart = nil
        try super.tearDownWithError()
    }
    
    func testFetchProductsResultSuccess() throws {
        let expectation = self.expectation(description: "Products Fetched")
        cart.fetchProducts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertNotNil(self.cart.allProducts)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testAddProduct() {
        cart.allProducts = ProductsResponse.dummyProducts
        let addedProduct = cart.allProducts?.first
        cart.addProduct(product: addedProduct)
        XCTAssertTrue(cart.selectedProducts.contains(where: { $0.id == addedProduct?.id}))
    }
    
    func testAddProductWithID() {
        cart.allProducts = ProductsResponse.dummyProducts
        let addedProductID = cart.allProducts?.randomElement()?.id
        cart.addProduct(withID: addedProductID)
        XCTAssertTrue(cart.selectedProducts.contains(where: {$0.id == addedProductID}))
    }
    
    func testAddRandomProduct() {
        cart.allProducts = ProductsResponse.dummyProducts
        cart.selectedProducts = []
        cart.addRandomProduct()
        XCTAssertTrue(cart.selectedProducts.count == 1)
    }
    
    func testRemoveProduct() {
        cart.allProducts = ProductsResponse.dummyProducts
        let addedProduct = cart.allProducts?.first
        cart.selectedProducts.append(addedProduct!)
        cart.removeProduct(withID: (addedProduct?.id)!)
        XCTAssertFalse(cart.selectedProducts.contains(where: {$0.id == addedProduct?.id}))
    }
    
    func testClearCart() {
        cart.allProducts = ProductsResponse.dummyProducts
        cart.selectedProducts.append(contentsOf: cart.allProducts!)
        cart.clearCart()
        XCTAssertTrue(cart.selectedProducts.isEmpty)
    }
    
    func testRemoveProductWhenEmpty() {
        cart.allProducts = ProductsResponse.dummyProducts
        let id = cart.allProducts?.first?.id
        cart.selectedProducts = []
        XCTAssertNoThrow(cart.removeProduct(withID: id!))
        XCTAssertTrue(cart.selectedProducts.isEmpty)
    }
    
    func testAddSameProductTwice() {
        // შევცვალე ლოგიკა ვიუმოდელში --> იხილეთ გაგრელება იქ :დ
        cart.allProducts = ProductsResponse.dummyProducts
        let product = cart.allProducts?.first
        cart.addProduct(product: product)
        cart.addProduct(product: product)
        XCTAssertTrue(cart.selectedProducts.last?.selectedQuantity == 2)
    }

    
}
