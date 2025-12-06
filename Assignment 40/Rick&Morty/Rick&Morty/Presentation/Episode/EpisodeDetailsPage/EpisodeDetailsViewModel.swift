//
//  EpisodeDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI
import Combine

@MainActor
class EpisodeDetailsViewModel: ObservableObject {
    let episode: Episode
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var characters: [Character] = []
    
    private let getCharactersForEpisodeUseCase: GetCharactersForEpisodeUseCase
    
    init(
        episode: Episode,
        getCharactersForEpisodeUseCase: GetCharactersForEpisodeUseCase
    ) {
        self.episode = episode
        self.getCharactersForEpisodeUseCase = getCharactersForEpisodeUseCase
    }
    
    func getCharacters() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            characters = try await getCharactersForEpisodeUseCase.execute(characterURLs: episode.characters)
        } catch {
            errorMessage = "Failed dowload: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
