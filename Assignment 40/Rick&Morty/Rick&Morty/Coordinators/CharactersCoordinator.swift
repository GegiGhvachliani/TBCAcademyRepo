//
//  CharactersCoordinator.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI
import Combine

class CharactersCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    init() {}
    
    func start() {
    }
    
    func navigateToCharacterDetails(_ character: Character) {
        path.append(character)
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
