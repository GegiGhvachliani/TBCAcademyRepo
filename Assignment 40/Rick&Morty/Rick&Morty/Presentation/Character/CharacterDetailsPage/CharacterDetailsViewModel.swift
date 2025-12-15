//
//  CharacterDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI
import Combine

@MainActor
class CharacterDetailsViewModel: ObservableObject {
    let character: Character
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var episodes: [Episode] = []
    
    @Published var episodeCharacters: [Int: [Character]] = [:]
    @Published var loadingEpisodes: Set<Int> = []
    @Published var episodeErrors: [Int: String] = [:]
    
    private let getEpisodesForCharacterUseCase: GetEpisodesForCharacterUseCase
    private let getCharactersForEpisodeUseCase: GetCharactersForEpisodeUseCase
    
    init(
        character: Character,
        getEpisodesForCharacterUseCase: GetEpisodesForCharacterUseCase,
        getCharactersForEpisodeUseCase: GetCharactersForEpisodeUseCase
    ) {
        self.character = character
        self.getEpisodesForCharacterUseCase = getEpisodesForCharacterUseCase
        self.getCharactersForEpisodeUseCase = getCharactersForEpisodeUseCase
    }
    
    func loadEpisodes() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            episodes = try await getEpisodesForCharacterUseCase.execute(episodeUrls: character.episode)
        } catch {
            self.errorMessage = "Failed to load episodes: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func loadCharacters(for episode: Episode) async {
        guard !loadingEpisodes.contains(episode.id),
              episodeCharacters[episode.id] == nil else { return }
        
        loadingEpisodes.insert(episode.id)
        episodeErrors[episode.id] = nil
        
        do {
            let characters = try await getCharactersForEpisodeUseCase.execute(characterURLs: episode.characters)
            episodeCharacters[episode.id] = characters
        } catch {
            episodeErrors[episode.id] = "Failed to load characters: \(error.localizedDescription)"
        }
        
        loadingEpisodes.remove(episode.id)
    }
}
