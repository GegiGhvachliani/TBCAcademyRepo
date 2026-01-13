//
//  FetchPokemonDetailUseCase.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

class FetchPokedexDetailUseCase {
    
    private let repository: PokedexRepositoryProtocol
    
    init(repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Pokedex, NetworkError> {
        repository.fetchPokedexDetail(id: id)
    }
}
