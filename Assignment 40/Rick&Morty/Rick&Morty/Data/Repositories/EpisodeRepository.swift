//
//  EpisodeRepository.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

class EpisodeRepository: EpisodeRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let baseUrl = "https://rickandmortyapi.com/api/episode"
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchEpisode(url: String) async throws -> Episode {
        try await networkService.fetchData(from: url)
    }
    
    func fetchEpisodes(url: String?) async throws -> EpisodeResponse {
        try await networkService.fetchData(from: url ?? baseUrl)
    }
    
    func searchEpisodeByName(name: String) async throws -> EpisodeResponse {
        let url = "\(baseUrl)/?name=\(name)"
        return try await networkService.fetchData(from: url)
    }
    
    func fetchCharactersForEpisodes(characterURLs: [String]) async throws -> [Character] {
        return try await withThrowingTaskGroup(of: Character.self) { group in
            
            for url in characterURLs {
                group.addTask {
                  try await self.networkService.fetchData(from: url)
                }
            }
            
            var characters: [Character] = []
            for try await character in group {
                characters.append(character)
            }
            return characters
        }
    }
}
