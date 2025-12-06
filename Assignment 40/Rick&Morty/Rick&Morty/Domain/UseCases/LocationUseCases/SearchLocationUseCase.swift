//
//  SearchLocationUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class SearchLocationUseCase {
    private let repository: LocationRepositoryProtocol
    
    init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(name: String) async throws -> LocationResponse {
        try await repository.searchLocationsByName(name: name)
    }
}
