//
//  EpisodeDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.episode.name)
                        .font(.title)
                        .bold()
                    
                    Text("Air Date: \(viewModel.episode.airDate)")
                        .font(.subheadline)
                    
                    Text("Episode: \(viewModel.episode.episode)")
                        .font(.subheadline)
                }
                .padding(.horizontal)
                
                VStack {
                    Text("Characters")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView("Loading characters...")
                        Spacer()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.characters, id: \.id) { character in
                                CharacterComponentView(
                                    name: character.name,
                                    imageURL: character.image
                                )
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            .task {
                await viewModel.getCharacters()
            }
        }
        .navigationTitle("Details")
    }
}

#Preview {
    MainView()
}
