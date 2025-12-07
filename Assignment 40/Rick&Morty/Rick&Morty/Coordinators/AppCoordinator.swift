//
//  AppCoordinator.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    var charactersCoordinator: CharactersCoordinator
    var episodesCoordinator: EpisodesCoordinator
    var locationsCoordinator: LocationsCoordinator
    
    @Published var selectedTab: Tab = .characters
    
    enum Tab {
        case characters, episodes, locations, search
    }
    
    init() {
        charactersCoordinator = DependencyContainer.shared.makeCharacterCoordinator()
        episodesCoordinator = DependencyContainer.shared.makeEpisodesCoordinator()
        locationsCoordinator = DependencyContainer.shared.makeLocationsCoordinator()
    }
    
    func start() {
    }
}
