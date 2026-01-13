//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 13.12.25.
//

import UIKit
import SwiftUI

class AppCoordinator {
    
    private let navigationController: UINavigationController
    private let container = DIContainter.shared
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showPokemonList()
    }
    
    private func showPokemonList() {
        let viewModel = container.makePokedexListViewModel()
        let viewController = PokedexListViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showPokedexDetails(pokedexItem: PokedexListItem) {
        let viewModel = container.makePokedexDetailsViewModel(pokedexItem: pokedexItem)
        let detailView = PokedexDetailsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        
        hostingController.navigationItem.hidesBackButton = true
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}

