//
//  GetEpisodeUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetEpisodeUseCase {
    private let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String) async throws -> Episode {
        try await repository.fetchEpisode(url: url)
    }
    
}
