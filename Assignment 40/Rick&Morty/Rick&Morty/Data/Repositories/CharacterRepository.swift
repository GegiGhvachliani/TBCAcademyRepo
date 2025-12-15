//
//  CharacterRepository.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let networkService : NetworkServiceProtocol
    private let baseURL = "https://rickandmortyapi.com/api/character"
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCharacter(url: String) async throws -> Character {
        try await networkService.fetchData(from: url)
    }
    
    func fetchCharacters(url: String?) async throws -> CharacterResponse {
        try await networkService.fetchData(from: url ?? baseURL)
    }
    
    func searchCharacterByName(name: String) async throws -> CharacterResponse {
        let url = "\(baseURL)/?name=\(name)"
        return try await networkService.fetchData(from: url)
    }
    
    func fetchEpisodesForCharacter(episodeURLs: [String]) async throws -> [Episode] {
        return try await withThrowingTaskGroup(of: Episode.self) { group in
            
            for url in episodeURLs {
                group.addTask {
                    try await self.networkService.fetchData(from: url)
                }
            }
            
            var episodes: [Episode] = []
            for try await episode in group {
                episodes.append(episode)
            }
            return episodes
        }
    }
}
