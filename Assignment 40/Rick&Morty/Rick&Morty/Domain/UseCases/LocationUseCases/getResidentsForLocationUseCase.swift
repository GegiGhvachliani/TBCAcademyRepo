//
//  getResidentsForLocationUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

class GetResidentsForLocationUseCase {
    private let repository: LocationRepositoryProtocol
    
    init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(residentsURLs: [String]) async throws -> [Character] {
        try await repository.fetchResidentsForLocation(residentURLs: residentsURLs)
    }
}
