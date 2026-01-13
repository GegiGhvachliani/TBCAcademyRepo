//
//  Coordinator.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI
import Combine

final class AppCoordinator: Coordinator, ObservableObject {
    
    @Published var path = NavigationPath()
    
    func showDetails(_ music: Music) {
        path.append(music)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func create(for music: Music) -> DetailsView {
        DetailsView(music: music)
    }
}
