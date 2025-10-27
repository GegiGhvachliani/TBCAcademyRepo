//
//  MainViewModel.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import Foundation

class MainViewModel {
    
    private(set) var nowShowingMovies: [Movie] = []
    private(set) var popularMovies: [Movie] = []
        
    func loadMovies() {
        let allMovies = Movie.allMovies
        nowShowingMovies = allMovies.filter { $0.type == .nowShowing || $0.type == .both }
        popularMovies = allMovies.filter { $0.type == .popular || $0.type == .both }
    }
}
