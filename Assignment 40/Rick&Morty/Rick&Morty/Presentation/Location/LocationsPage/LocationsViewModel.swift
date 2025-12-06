//
//  LocationsViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import Combine
import Foundation

@MainActor
class LocationsViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var locations: [Location] = []
    
    private var nextPageUrl: String?
    
    private let getLocationsUseCase: GetLocationsUseCase
    
    init(getLocationsUseCase: GetLocationsUseCase) {
        self.getLocationsUseCase = getLocationsUseCase
    }
    
    func getInitialLocations() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getLocationsUseCase.execute()
            locations = response.results
            nextPageUrl = response.info.next
        } catch {
            errorMessage = "Failed to load locations: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func getMoreLocations() async {
        guard !isLoading,
              let nextURL = nextPageUrl else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await getLocationsUseCase.execute(url: nextURL)
            locations.append(contentsOf: response.results)
            nextPageUrl = response.info.next
        } catch {
            errorMessage = "Failed to load more Loactions: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
