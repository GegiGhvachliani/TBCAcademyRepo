//
//  GetCharacterUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetCharacterUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String) async throws -> Character {
        try await repository.fetchCharacter(url: url)
    }
}
