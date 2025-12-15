//
//  LocationRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

protocol LocationRepositoryProtocol {
    func fetchLocation(url: String) async throws -> Location
    func fetchLocations(url: String?) async throws -> LocationResponse
    func searchLocationsByName(name: String) async throws -> LocationResponse
    func fetchResidentsForLocation(residentURLs: [String]) async throws -> [Character]
}
