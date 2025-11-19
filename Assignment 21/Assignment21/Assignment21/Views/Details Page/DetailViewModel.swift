//
//  DetailViewModel.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import Foundation

class DetailViewModel {
        
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        movie.title
    }
    var bannerName: String {
        movie.bannerName
    }
    var rating: Double {
        movie.rating
    }
    var duration: String {
        movie.duration
    }
    var description: String {
        movie.description
    }
    var genres: [String] {
        movie.genres
    }
    var language: String {
        movie.language
    }
    var ageRating: String {
        movie.ageRating
    }
    var cast: [String] {
        movie.cast
    }
}
