//
//  CharacterRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

protocol CharacterRepositoryProtocol {
    func fetchCharacter(url: String) async throws -> Character
    func fetchCharacters(url: String?) async throws -> CharacterResponse
    func searchCharacterByName(name: String) async throws -> CharacterResponse
    func fetchEpisodesForCharacter(episodeURLs: [String]) async throws -> [Episode]
}
