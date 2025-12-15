//
//  GetEpisodesUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetEpisodesUseCase {
    private let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepository) {
        self.repository = repository
    }
    
    func execute(url: String? = nil) async throws -> EpisodeResponse {
        try await repository.fetchEpisodes(url: url)
    }
}
