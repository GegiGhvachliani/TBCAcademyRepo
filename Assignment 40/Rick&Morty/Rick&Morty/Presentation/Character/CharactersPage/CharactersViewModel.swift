//
//  CharactersViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import Foundation
import Combine

@MainActor
class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var nextPageUrl: String?
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func getInitialCharacters() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getCharactersUseCase.execute()
            nextPageUrl = response.info.next
            characters = response.results
        } catch {
            errorMessage = "Failed to load characters: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func getMoreCharacters() async {
        guard !isLoading,
              let nextURL = nextPageUrl else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getCharactersUseCase.execute(url: nextURL)
            nextPageUrl = response.info.next
            characters.append(contentsOf: response.results)
            
        } catch {
            errorMessage = "Failed to load characters: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
