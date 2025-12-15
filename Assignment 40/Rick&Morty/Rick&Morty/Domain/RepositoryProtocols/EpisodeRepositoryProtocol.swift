//
//  EpisodeRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

protocol EpisodeRepositoryProtocol {
    func fetchEpisode(url: String) async throws -> Episode
    func fetchEpisodes(url: String?) async throws -> EpisodeResponse
    func searchEpisodeByName(name: String) async throws -> EpisodeResponse
    func fetchCharactersForEpisodes(characterURLs: [String]) async throws -> [Character]
}

