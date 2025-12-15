//
//  NetworkServiceProtocol.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

protocol NetworkServiceProtocol {
    func fetchData<T: Codable>(from urlString: String) async throws -> T
}
