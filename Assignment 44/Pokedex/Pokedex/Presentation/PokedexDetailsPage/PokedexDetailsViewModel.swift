//
//  PokedexDetailsViewModel.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine
import SwiftUI

class PokedexDetailViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var pokedex: Pokedex?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var primaryTypeColor: Color = .blue
    
    // MARK: - Properties
    private let pokedexID: Int
    private let pokedexItem: PokedexListItem
    private let fetchDetailUseCase: FetchPokedexDetailUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Computed Properties
    var displayName: String {
        pokedexItem.name.capitalized
    }
    
    var formatedID: String {
        pokedexItem.formattedID
    }
    
    var imageURL: String {
        if let pokedex = pokedex,
           let apiImage = pokedex.sprites.other.officialArtwork.frontDefault {
            return apiImage
        }
        
        return pokedexItem.imageURL
    }
    
    
    var heightInMeters: String {
        guard let pokedex = pokedex else { return "0.0 m" }
        let meters = Double(pokedex.height) / 10.0
        return String(format: "%.1f m", meters)
    }
    
    var weightInKilograms: String {
        guard let pokedex = pokedex else { return "0.0 kg" }
        let kg = Double(pokedex.weight) / 10.0
        return String(format: "%.1f kg", kg)
    }
    
    // MARK: - Initializations
    init(pokedexItem: PokedexListItem, fetchDetailUseCase: FetchPokedexDetailUseCase) {
        self.pokedexItem = pokedexItem
        self.pokedexID = pokedexItem.id
        self.fetchDetailUseCase = fetchDetailUseCase
    }
    
    // MARK: - Methods
    func fetchPokedexDetail() {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        fetchDetailUseCase.execute(id: pokedexID)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] pokedex in
                    self?.pokedex = pokedex
                    
                    if let firstType = pokedex.types.first?.type.name {
                        self?.primaryTypeColor = PokedexTypeColors.color(for: firstType)
                    }
                }
            )
            .store(in: &cancellables)
    }
}
