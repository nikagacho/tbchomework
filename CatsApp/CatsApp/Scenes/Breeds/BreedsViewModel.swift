//
//  BreedsViewModel.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import Foundation
import NetworkLayerPackage

protocol BreedsViewModelDelegate: AnyObject {
    func didFetchBreeds()
}

final class BreedsViewModel {
    //MARK: - Properties

    var breeds: [Breed] = []
    weak var delegate: BreedsViewModelDelegate?
    
    func viewDidLoad() {
        fetchData()
    }
    
    //MARK: - Methods

    func fetchData() {
        Task {
            do {
                let networkManager = NetworkManager<CatBreed>()
                let result = try await networkManager.fetchData(from: "https://catfact.ninja/breeds")
                self.breeds = result.data
                delegate?.didFetchBreeds()
            } catch {
                print(error)
            }
        }
    }
    
}
