//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    func fetchData<T: Codable>(from urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
