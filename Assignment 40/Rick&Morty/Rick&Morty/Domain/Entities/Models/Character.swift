//
//  Character.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

struct CharacterResponse: Codable {
    let results: [Character]
    let info: Info
}

struct Character: Codable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    
    struct Origin: Codable, Hashable {
        let name: String
        let url: String
    }
    
    struct Location: Codable, Hashable{
        let name: String
        let url: String
    }
}
