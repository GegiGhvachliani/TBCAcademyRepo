//
//  PokedexRepository.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

class PokedexRepository: PokedexRepositoryProtocol {
    
    private let networkService: NetworkService
    private let baseURL = "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchPokedexList(url: String?) -> AnyPublisher<PokedexListResponse, NetworkError> {
        networkService.fetchPokedexList(url: url ?? baseURL)
    }
    
    func fetchPokedexDetail(id: Int) -> AnyPublisher<Pokedex, NetworkError> {
        return networkService.fetchPokedexDetail(id: id)
    }
}
