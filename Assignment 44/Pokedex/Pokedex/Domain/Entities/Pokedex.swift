//
//  Pokedex.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation

struct Pokedex: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    let types: [TypeElement]
    let stats: [Stat]
}

struct Sprites: Decodable {
    let other: Other
}

struct Other: Decodable {
    let officialArtwork: Artwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Artwork: Decodable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct TypeElement: Decodable {
    let type: TypeDetail
}

struct TypeDetail: Decodable {
    let name: String
}

struct Stat: Decodable {
    let baseStat: Int  
    let stat: StatDetail
}

struct StatDetail: Decodable {
    let name: String
}
