//
//  LocationDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI
import Combine

@MainActor
class LocationDetailsViewModel: ObservableObject {
    let location: Location
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var characters: [Character] = []
    
    private let getResidentsForLocationUseCase: GetResidentsForLocationUseCase
    
    init(
        location: Location,
        getResidentsForLocationUseCase: GetResidentsForLocationUseCase
    ) {
        self.location = location
        self.getResidentsForLocationUseCase = getResidentsForLocationUseCase
    }
    
    func getResidents() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            characters = try await getResidentsForLocationUseCase.execute(residentsURLs: location.residents)
        } catch {
            errorMessage = "Failed download: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
