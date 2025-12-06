//
//  CharacterDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    @State private var expandedEpisodeIDs = Set<Int>()
    
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
                                    VStack(spacing: 0) {
                                        EpisodeRow(episode: episode)
                                        
                                        if expandedEpisodeIDs.contains(episode.id) {
                                            Divider()
                                                .padding(.horizontal, 15)
                                            
                                            if viewModel.loadingEpisodes.contains(episode.id) {
                                                ProgressView("Loading characters...")
                                                    .padding()
                                            } else if let error = viewModel.episodeErrors[episode.id] {
                                                Text(error)
                                                    .foregroundColor(.red)
                                                    .padding()
                                            } else if let characters = viewModel.episodeCharacters[episode.id] {
                                                VStack(spacing: 8) {
                                                    Text("Casts:")
                                                        .font(.custom("Creepster-Regular", size: 15))
                                                        .bold()
                                                        .foregroundStyle(.valueBrown)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .padding(.horizontal, 15)
                                                        .padding(.top, 8)
                                                    
                                                    ScrollView(.horizontal, showsIndicators: false) {
                                                        LazyHStack(spacing: 10) {
                                                            ForEach(characters, id: \.id) { character in
                                                                EpisodeCharacterCardView(
                                                                    name: character.name,
                                                                    imageURL: character.image
                                                                )
                                                            }
                                                        }
                                                        .padding(.horizontal, 15)
                                                    }
                                                    .frame(height: 95)
                                                    .padding(.bottom, 8)
                                                }
                                                .transition(.opacity)
                                            }
                                        }
                                    }
                                    .cornerRadius(8)
                                    .padding(.horizontal, 15)
                                    .onTapGesture {
                                        withAnimation {
                                            if expandedEpisodeIDs.contains(episode.id) {
                                                expandedEpisodeIDs.remove(episode.id)
                                            } else {
                                                expandedEpisodeIDs.insert(episode.id)
                                                Task {
                                                    await viewModel.loadCharacters(for: episode)
                                                }
                                            }
                                        }
                                    }
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
