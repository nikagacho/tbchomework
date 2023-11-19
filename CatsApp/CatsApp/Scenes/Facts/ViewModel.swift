//
//  ViewModel.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import Foundation
import NetworkLayerPackage

protocol ViewModelDelegate: AnyObject{
    func didFetchCats()
}

final class ViewModel {
    //MARK: - Properties

    var catFacts: [CatFact] = []
    weak var delegate: ViewModelDelegate?
    
    func viewDidLoad() {
        fetchData()
    }
    
    //MARK: - Methods
    
    func fetchData() {
        Task {
            do {
                let networkManager = NetworkManager<CatFactsResponse>()
                let result = try await networkManager.fetchData(from: "https://catfact.ninja/facts")
                self.catFacts = result.data
                delegate?.didFetchCats()
            } catch {
                print(error)
            }
        }
    }
    
}

