//
//  NetworkManager.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 10.11.23.
//

import Foundation

var moviesList: [newMovie] = []

func getMovie(homeURL: String) async throws -> newMovie {
    
    guard let url = URL(string: homeURL) else { throw MovieError.invalidData }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw MovieError.invalidResponse}
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(newMovie.self, from: data)
    } catch {
        throw MovieError.invalidData
    }
    
}

enum MovieError: Error {
    case invalidData
    case invalidURL
    case invalidResponse
}
