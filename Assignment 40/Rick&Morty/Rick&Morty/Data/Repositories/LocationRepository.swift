//
//  LocationRepository.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

class LocationRepository: LocationRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let baseURL = "https://rickandmortyapi.com/api/location"
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchLocation(url: String) async throws -> Location {
        try await networkService.fetchData(from: url)
    }
    
    func fetchLocations(url: String?) async throws -> LocationResponse {
        try await networkService.fetchData(from: url ?? baseURL)
    }
    
    func searchLocationsByName(name: String) async throws -> LocationResponse {
        let url = "\(baseURL)/?location=\(name)"
        return try await networkService.fetchData(from: url)
    }
    
    func fetchResidentsForLocation(residentURLs: [String]) async throws -> [Character] {
        return try await withThrowingTaskGroup(of: Character.self) { group in
            
            for url in residentURLs {
                group.addTask {
                    try await self.networkService.fetchData(from: url)
                }
            }
            
            var residents: [Character] = []
            for try await resident in group {
                residents.append(resident)
            }
            return residents
        }
    }
}


