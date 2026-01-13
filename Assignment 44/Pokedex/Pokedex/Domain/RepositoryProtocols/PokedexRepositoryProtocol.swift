//
//  PokedexRepository.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

protocol PokedexRepositoryProtocol {
    func fetchPokedexList(url: String?) -> AnyPublisher<PokedexListResponse, NetworkError>
    func fetchPokedexDetail(id: Int) -> AnyPublisher<Pokedex, NetworkError>
}
