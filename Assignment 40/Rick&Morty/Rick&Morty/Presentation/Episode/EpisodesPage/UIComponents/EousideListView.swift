//
//  EousideListView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodesListView: View {
    @ObservedObject var viewModel: EpisodesViewModel
    @ObservedObject var coordinator: EpisodesCoordinator
    
    var body: some View {
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
}
