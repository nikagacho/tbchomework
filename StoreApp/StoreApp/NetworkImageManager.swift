//
//  NetworkImageManager.swift
//  StoreApp
//
//  Created by Nikoloz Gachechiladze on 18.12.23.
//

import Foundation
import NetworkLayerPackage

extension NetworkManager {
    public func fetchImageData(from url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.requestFailed
        }
    }
}
