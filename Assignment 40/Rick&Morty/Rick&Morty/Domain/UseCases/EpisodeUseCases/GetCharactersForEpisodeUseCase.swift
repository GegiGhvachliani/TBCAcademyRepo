//
//  GetCharactersForEpisodeUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

class GetCharactersForEpisodeUseCase {
    private let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(characterURLs: [String]) async throws -> [Character] {
        try await repository.fetchCharactersForEpisodes(characterURLs: characterURLs)
    }
}
