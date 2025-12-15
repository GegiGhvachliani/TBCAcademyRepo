//
//  LocationsCoordinator.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI
import Combine

class LocationsCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    init() {}
    
    func start() {
    }
    
    func navigateToDetails(_ location: Location) {
        path.append(location)
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

