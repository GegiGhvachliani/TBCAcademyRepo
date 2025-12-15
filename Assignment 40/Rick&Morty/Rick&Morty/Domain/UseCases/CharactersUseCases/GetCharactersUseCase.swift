//
//  GetCharactersUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetCharactersUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String? = nil) async throws -> CharacterResponse {
        try await repository.fetchCharacters(url: url)
    }
}
