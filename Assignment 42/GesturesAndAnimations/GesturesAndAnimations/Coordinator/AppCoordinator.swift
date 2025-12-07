//
//  Coordinator.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 07.12.25.
//

import Combine

class AppCoordinator: Coordinator {
    @Published var path: [Route] = []
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func goToRoot() {
        path.removeAll()
    }
    

}
