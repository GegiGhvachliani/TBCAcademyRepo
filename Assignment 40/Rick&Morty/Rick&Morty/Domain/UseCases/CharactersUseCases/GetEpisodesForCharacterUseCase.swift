//
//  GetEpisodesForCharacter.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

class GetEpisodesForCharacterUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(episodeUrls: [String]) async throws -> [Episode] {
       try await repository.fetchEpisodesForCharacter(episodeURLs: episodeUrls)
    }
}
