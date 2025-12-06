//
//  Episode.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

struct EpisodeResponse: Codable {
    let results: [Episode]
    let info: Info
}

struct Episode: Codable, Hashable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
    }
}
