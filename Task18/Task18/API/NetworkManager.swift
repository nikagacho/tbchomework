//
//  NetworkManager.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 10.11.23.
//

import Foundation

struct newMovie: Codable {
    let title: String
    let overview: String
    let release_date: String
    let runtime: Int
    let budget: Int
    let vote_average: Double
    let revenue: Int
    let poster_path: String?
}

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


func getMovieUsingGCD(homeURL: String, completion: @escaping (Result<newMovie, Error>) -> Void) {
    guard let url = URL(string: homeURL) else {
        completion(.failure(MovieError.invalidURL))
        return
    }

    DispatchQueue.global().async {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(MovieError.invalidResponse))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let movie = try decoder.decode(newMovie.self, from: data!)

                DispatchQueue.main.async {
                    completion(.success(movie))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
