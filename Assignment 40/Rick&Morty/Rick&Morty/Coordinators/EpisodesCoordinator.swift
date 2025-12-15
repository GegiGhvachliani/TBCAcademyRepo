//
//  EpisodesCoordinator.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI
import Combine

class EpisodesCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    init() {}
    
    func start() {
    }
    
    func navigateToEpisodeDetails(_ episode: Episode) {
        path.append(episode)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}
