//
//  MainViewModel.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import Foundation

class DetailViewModel {
    
    // MARK: - Properties
    private let movie: Movie
    
    weak var coordinator: MainCoordinator?
    
    var onMovieLoaded: (() -> Void)?
    
    // MARK: - Initialization
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: - Methods
    func loadMovie() {
        onMovieLoaded?()
    }
    
    func didTapBanner() {
        coordinator?.showPoster(bannerName: movie.bannerName, title: movie.title)
    }
    
    // MARK: - Computed Properties
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
