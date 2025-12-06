//
//  SearchEpisodeUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class SearchEpisodeUseCase {
    private let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(name: String) async throws -> EpisodeResponse {
        try await repository.searchEpisodeByName(name: name)
    }
}
