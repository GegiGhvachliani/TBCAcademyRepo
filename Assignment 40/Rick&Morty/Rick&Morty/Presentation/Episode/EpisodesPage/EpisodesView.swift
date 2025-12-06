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
                VStack {
                    if viewModel.isLoading && viewModel.episodes.isEmpty {
                        Spacer()
                        ProgressView("Loading Episodes...")
                        Spacer()
                    } else if let error = viewModel.errorMessage {
                        Spacer()
                        Text(error)
                            .foregroundStyle(.red)
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 5) {
                                ForEach(viewModel.episodes, id: \.id) { episode in
                                    EpisodeRowWithImage(episode: episode)
                                        .onTapGesture {
                                            coordinator.navigateToEpisodeDetails(episode)
                                        }
                                        .onAppear {
                                            if episode.id == viewModel.episodes.last?.id {
                                                Task {
                                                    await viewModel.getMoreEpisodes()
                                                }
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 15)
                            .padding(.top, 40)
                        }
                    }
                }
                .navigationDestination(for: Episode.self, destination: { episode in
                    EpisodeDetailsView(viewModel: DependencyContainer.shared.makeEpisodeDetailsViewModel(episode: episode))
                })
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
}


#Preview {
    EpisodesView(
        viewModel: DependencyContainer.shared.makeEpisodesViewModel(),
        coordinator: DependencyContainer.shared.makeEpisodesCoordinator())
}
