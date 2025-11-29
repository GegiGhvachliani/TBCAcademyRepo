//
//  MainViewModel.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import Foundation

class MainViewModel {
    
    // MARK: - Properties
    private let repository = MovieRepository()
    
    private(set) var nowShowingMovies: [Movie] = []
    private(set) var popularMovies: [Movie] = []
    
    weak var coordinator: MainCoordinator?
    
    var onMoviesLoaded: (() -> Void)?
    
    // MARK: - Methods
    func loadMovies() {
        let allMovies = repository.getAllMovies()
        
        nowShowingMovies = allMovies.filter { $0.type == .nowShowing || $0.type == .both }
        popularMovies = allMovies.filter { $0.type == .popular || $0.type == .both }
        
        onMoviesLoaded?()
    }
    
    func didSelectMovie(_ movie: Movie) {
        coordinator?.showDetails(for: movie)
    }
    
    func didTapPoster(_ movie: Movie) {
            coordinator?.showPoster(bannerName: movie.bannerName, title: movie.title)
        }
}
