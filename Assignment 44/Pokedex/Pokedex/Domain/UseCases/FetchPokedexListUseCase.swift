//
//  FetchPokedexListUseCase.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

class FetchPokedexListUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String? = nil) -> AnyPublisher<PokedexListResponse, NetworkError> {
        repository.fetchPokedexList(url: url)
    }
}
