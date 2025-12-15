//
//  PokedexListItem.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation

struct PokedexListResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokedexListItem]
}

struct PokedexListItem: Decodable {
    let name: String
    let url: String
    
    var id: Int {
        let components = url.components(separatedBy: "/").filter { !$0.isEmpty }
        if let lastComponent = components.last, let id = Int(lastComponent) {
            return id
        }
        return 0
    }
    
    var formattedID: String {
        String(format: "#%03d", id)
    }
    
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    var imageScale: CGFloat {
        let remainder = id % 3
        switch remainder {
        case 0: return 1
        case 1: return 0.6
        case 2: return 0.8
        default: return 1.0
        }
    }
}
