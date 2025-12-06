//
//  Location.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

struct LocationResponse: Codable {
    let results: [Location]
    let info: Info
}

struct Location: Codable, Hashable {
    let id: Int
    let name: String
    let dimension: String
    let residents: [String]
    let url: String
}
