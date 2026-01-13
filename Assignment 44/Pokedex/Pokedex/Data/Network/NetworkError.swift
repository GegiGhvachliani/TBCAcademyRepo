//
//  NetworkError.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 14.12.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
    case serverError(String)
    
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingFailed:
            return "Failed to decode data"
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}
