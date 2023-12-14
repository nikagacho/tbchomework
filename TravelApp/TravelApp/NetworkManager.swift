//
//  NetworkManager.swift
//  TravelApp
//
//  Created by Nikoloz Gachechiladze on 14.12.23.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

public class NetworkManager<T: Codable> {
    public init() {}
    public func fetchData(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.requestFailed
        }
    }
}
