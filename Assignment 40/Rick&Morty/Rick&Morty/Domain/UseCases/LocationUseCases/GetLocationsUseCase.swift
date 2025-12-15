//
//  GetLocationsUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetLocationsUseCase {
    private let repository: LocationRepositoryProtocol
    
    init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String? = nil) async throws -> LocationResponse {
        try await repository.fetchLocations(url: url)
    }
}
