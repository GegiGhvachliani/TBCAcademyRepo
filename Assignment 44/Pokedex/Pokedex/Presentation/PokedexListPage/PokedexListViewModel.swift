//
//  PokedexListViewModel.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation
import Combine

class PokedexListViewModel {
    
    @Published var pokedexes: [PokedexListItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var nextPageUrl: String?
    private let fetchPokedexListUseCase: FetchPokedexListUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchPokedexListUseCase: FetchPokedexListUseCase) {
        self.fetchPokedexListUseCase = fetchPokedexListUseCase
    }
    
    
    
    func fetchPokedexes() {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        fetchPokedexListUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] response in
                    self?.nextPageUrl = response.next
                    self?.pokedexes = response.results
                }
            )
            .store(in: &cancellables)
    }
    
    func loadMore() {
        guard !isLoading,
              let nextURL = nextPageUrl else { return }
        
        isLoading = true
        errorMessage = nil
        
        fetchPokedexListUseCase.execute(url: nextURL)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] response in
                    self?.nextPageUrl = response.next
                    self?.pokedexes.append(contentsOf: response.results)
                }
            )
            .store(in: &cancellables)
    }
}

