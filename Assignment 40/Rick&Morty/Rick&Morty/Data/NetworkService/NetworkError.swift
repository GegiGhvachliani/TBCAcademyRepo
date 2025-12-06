//
//  NetworkError.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingFailed
    case badResponse
    case httpError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .noData:
            return "No data received from server."
        case .decodingFailed:
            return "Failed to decode response."
        case .badResponse:
            return "Bad server response."
        case .httpError(let code):
            return "HTTP error with status code \(code)."
        }
    }
}
