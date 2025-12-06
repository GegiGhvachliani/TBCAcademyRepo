//
//  SearchViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI
import Combine

enum SearchType: String, CaseIterable {
    case characters = "Characters"
    case episodes = "Episodes"
    case locations = "Locations"
}

@MainActor
class SearchViewModel: ObservableObject {
    @Published var selectedType: SearchType = .characters
    
    @Published var searchText: String = ""
    
    @Published var characters: [Character] = []
    @Published var episodes: [Episode] = []
    @Published var locations: [Location] = []
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let searchCharacterUseCase: SearchCharacterUseCase
    private let searchEpisodeUseCase: SearchEpisodeUseCase
    private let searchLocationUseCase: SearchLocationUseCase
    
    init(
        searchCharacterUseCase: SearchCharacterUseCase,
        searchEpisodeUseCase: SearchEpisodeUseCase,
        searchLocationUseCase: SearchLocationUseCase
    ) {
        self.searchCharacterUseCase = searchCharacterUseCase
        self.searchEpisodeUseCase = searchEpisodeUseCase
        self.searchLocationUseCase = searchLocationUseCase
    }
    
    func search() async {
        let trimmedText = searchText.trimmingCharacters(in: .whitespaces)
        guard !trimmedText.isEmpty else {
            clearResults()
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            switch selectedType {
            case .characters:
                episodes = []
                locations = []
                
                let response = try await searchCharacterUseCase.execute(name: trimmedText)
                characters = response.results
                
            case .episodes:
                characters = []
                locations = []
                
                let response = try await searchEpisodeUseCase.execute(name: trimmedText)
                episodes = response.results
                
            case .locations:
                characters = []
                episodes = []
                
                let response = try await searchLocationUseCase.execute(name: trimmedText)
                locations = response.results
            }
        } catch {
            errorMessage = "Search failed: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func clearResults() {
        characters = []
        episodes = []
        locations = []
        searchText = ""
        errorMessage = nil
    }
    
    func onSegmentChange() {
        characters = []
        episodes = []
        locations = []
        errorMessage = nil
        
        if !searchText.trimmingCharacters(in: .whitespaces).isEmpty {
            Task {
                await search()
            }
        }
    }
    
    private var searchTask: Task<Void, Never>?
        
        func onSearchTextChange(_ newText: String) {
            searchTask?.cancel()
            
            searchTask = Task {
                try? await Task.sleep(nanoseconds: 500_000_000)
                
                guard !Task.isCancelled else { return }
                
                await search()
            }
        }
}
