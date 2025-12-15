//
//  SearchResultsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct SearchResultsView: View {
    let selectedType: SearchType
    let characters: [Character]
    let episodes: [Episode]
    let locations: [Location]
    let isLoading: Bool
    let errorMessage: String?
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10),
        GridItem(.adaptive(minimum: 170), spacing: 10)
    ]
    
    var body: some View {
        Group {
            if isLoading {
                Spacer()
                ProgressView("Searching...")
                Spacer()
            } else if let error = errorMessage {
                Spacer()
                Text(error)
                    .foregroundColor(.red)
                Spacer()
            } else if characters.isEmpty && episodes.isEmpty && locations.isEmpty {
                Spacer()
                Text("Type to search")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ScrollView {
                    switch selectedType {
                    case .characters:
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(characters, id: \.id) { character in
                                NavigationLink(value: character) {
                                    CharacterComponentView(
                                        name: character.name,
                                        imageURL: character.image
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                    case .episodes:
                        LazyVStack(spacing: 5) {
                            ForEach(episodes, id: \.id) { episode in
                                NavigationLink(value: episode) {
                                    EpisodeRow(episode: episode)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        
                    case .locations:
                        LazyVStack(spacing: 5) {
                            ForEach(locations, id: \.id) { location in
                                NavigationLink(value: location) {
                                    LocationRow(location: location)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}
