//
//  NetworkService.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

class NetworkService {
    
    private let baseURL = "https://pokeapi.co/api/v2"
    
    func fetchPokedexList(url: String) -> AnyPublisher<PokedexListResponse, NetworkError> {
        
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokedexListResponse.self, decoder: JSONDecoder())
            .mapError { _ in NetworkError.decodingFailed }
            .eraseToAnyPublisher()
    }
    
    func fetchPokedexDetail(id: Int) -> AnyPublisher<Pokedex, NetworkError> {
        
        let urlString = "\(baseURL)/pokemon/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Pokedex.self, decoder: decoder)
            .mapError { _ in NetworkError.decodingFailed }
            .eraseToAnyPublisher()
    }
}

