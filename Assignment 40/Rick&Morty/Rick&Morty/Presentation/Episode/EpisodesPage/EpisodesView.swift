//
//  EpisodesView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct EpisodesView: View {
    @ObservedObject var viewModel: EpisodesViewModel
    @ObservedObject var coordinator: EpisodesCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                EpisodesListView(viewModel: viewModel, coordinator: coordinator)
            }
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(viewModel: DependencyContainer.shared.makeEpisodeDetailsViewModel(episode: episode))
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Episodes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 60)
                }
            }
        }
        .task {
            await viewModel.getInitialEpisodes()
        }
    }
}

#Preview {
    EpisodesView(
        viewModel: DependencyContainer.shared.makeEpisodesViewModel(),
        coordinator: DependencyContainer.shared.makeEpisodesCoordinator()
    )
}
