//
//  EpisodeItemView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodeItemView: View {
    let episode: Episode
    @ObservedObject var viewModel: CharacterDetailsViewModel
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            EpisodeRow(episode: episode)
            
            if isExpanded {
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
                isExpanded.toggle()
                if isExpanded {
                    Task {
                        await viewModel.loadCharacters(for: episode)
                    }
                }
            }
        }
    }
}
