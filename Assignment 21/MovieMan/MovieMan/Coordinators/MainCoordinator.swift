//
//  MainCoordinator.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    func start() {
        showMainPage()
    }
    
    private func showMainPage() {
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        
        let mainPageVC = MainPageVC(viewModel: viewModel)
        navigationController.pushViewController(mainPageVC, animated: false)
    }
    
    func showDetails(for movie: Movie) {
        let viewModel = DetailViewModel(movie: movie)
        viewModel.coordinator = self
        
        let detailsPageVC = DetailsPageVC(viewModel: viewModel)
        navigationController.pushViewController(detailsPageVC, animated: true)
    }
    

    func showPoster(bannerName: String, title: String) {
        let posterPageVC = PosterPageVC(bannerName: bannerName, title: title)
        navigationController.pushViewController(posterPageVC, animated: true)
    }
}
