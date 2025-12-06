//
//  SearchCharacterUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class SearchCharacterUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(name: String) async throws -> CharacterResponse {
        try await repository.searchCharacterByName(name: name)
    }
}
