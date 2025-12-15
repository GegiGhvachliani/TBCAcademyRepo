//
//  CharacterDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    CharacterInfoView(viewModel: viewModel)
                    VStack {
                        Text("Episodes")
                            .font(.custom("GetSchwifty-Regular", size: 40))
                            .bold()
                            .padding(.horizontal)
                        
                        if viewModel.isLoading {
                            Spacer()
                            ProgressView("Loading episodes...")
                            Spacer()
                        } else if let error = viewModel.errorMessage {
                            Text("Error: \(error)")
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        } else {
                            LazyVStack(spacing: 5) {
                                ForEach(viewModel.episodes, id: \.id) { episode in
                                    EpisodeItemView(episode: episode, viewModel: viewModel)
                                }
                            }
                        }
                    }
                }
                .task {
                    await viewModel.loadEpisodes()
                }
            }
        }
    }
}

#Preview {
    CharactersView(
        viewModel: DependencyContainer.shared.makeCharactersViewModel(),
        coordinator: DependencyContainer.shared.makeCharacterCoordinator()
    )
}
