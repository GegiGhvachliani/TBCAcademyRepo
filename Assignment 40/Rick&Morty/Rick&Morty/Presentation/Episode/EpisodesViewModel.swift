//
//  EpisodesViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import Foundation
import Combine

@MainActor
class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var nextPageURL: String?
    
    private let getEpisodesUseCase: GetEpisodesUseCase
    
    init(getEpisodesUseCase: GetEpisodesUseCase) {
        self.getEpisodesUseCase = getEpisodesUseCase
    }
    
    func getInitialEpisodes() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getEpisodesUseCase.execute()
            episodes = response.results
            nextPageURL = response.info.next
        } catch {
            errorMessage = "Failed to load episodes: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func getMoreEpisodes() async {
        guard !isLoading,
              let nextURL = nextPageURL else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getEpisodesUseCase.execute(url: nextURL)
            episodes.append(contentsOf: response.results)
            nextPageURL = response.info.next
        } catch {
            errorMessage = "Failed to load episodes: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
