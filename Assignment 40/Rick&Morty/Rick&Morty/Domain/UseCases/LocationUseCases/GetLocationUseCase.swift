//
//  GetLocationUseCase.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

class GetLocationUseCase {
    private let repository: LocationRepositoryProtocol
    
    init(repository: LocationRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(url: String) async throws -> Location {
        try await repository.fetchLocation(url: url)
    }
}
