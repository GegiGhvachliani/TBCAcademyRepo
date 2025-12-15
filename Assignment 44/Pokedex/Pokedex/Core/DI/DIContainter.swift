//
//  DIContainter.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation

class DIContainter {
    
    static let shared = DIContainter()
    
    private init() {}
    
    // MARK: - Services
    private lazy var networkService: NetworkService = {
        return NetworkService()
    }()
    
    // MARK: Repositories
    func makePokedexRepository() -> PokedexRepositoryProtocol {
        PokedexRepository(networkService: networkService)
    }
    
    // MARK: Use Cases
    func makeFetchPokedexListUseCase() -> FetchPokedexListUseCase {
        FetchPokedexListUseCase(repository: makePokedexRepository())
    }
    
    func makeFetchPokedexDetailUseCase() -> FetchPokedexDetailUseCase {
        FetchPokedexDetailUseCase(repository: makePokedexRepository())
    }
    
    // MARK: - ViewModels
    func makePokedexListViewModel() -> PokedexListViewModel {
        return PokedexListViewModel(
            fetchPokedexListUseCase: makeFetchPokedexListUseCase()
        )
    }
    
    func makePokedexDetailsViewModel(pokedexItem: PokedexListItem) -> PokedexDetailViewModel {
        return PokedexDetailViewModel(
            pokedexItem: pokedexItem,
            fetchDetailUseCase: makeFetchPokedexDetailUseCase()
        )
    }
}
