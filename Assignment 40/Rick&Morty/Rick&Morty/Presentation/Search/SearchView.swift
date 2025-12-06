//
//  SearchView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = DependencyContainer.shared.makeSearchViewModel()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Search Type", selection: $viewModel.selectedType) {
                    ForEach(SearchType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: viewModel.selectedType) { _ in
                    viewModel.onSegmentChange()
                }
                
                HStack {
                    TextField("Search...", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                    
                    if !viewModel.searchText.isEmpty {
                        Button(action: {
                            viewModel.clearResults()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Searching...")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    Text(error)
                        .foregroundColor(.red)
                    Spacer()
                } else if viewModel.characters.isEmpty &&
                          viewModel.episodes.isEmpty &&
                          viewModel.locations.isEmpty {
                    Spacer()
                    Text("Type to search")
                        .foregroundColor(.secondary)
                    Spacer()
                } else {
                    ScrollView {
                        switch viewModel.selectedType {
                        case .characters:
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(viewModel.characters, id: \.id) { character in
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
                                ForEach(viewModel.episodes, id: \.id) { episode in
                                    NavigationLink(value: episode) {
                                        EpisodeRow(episode: episode)
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        case .locations:
                            LazyVStack(spacing: 5) {
                                ForEach(viewModel.locations, id: \.id) { location in
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
            .navigationTitle("Search")
            .navigationDestination(for: Character.self) { character in
                CharacterDetailsView(
                    viewModel: DependencyContainer.shared.makeCharacterDetailsViewModel(
                        character: character
                    )
                )
            }
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(
                    viewModel: DependencyContainer.shared.makeEpisodeDetailsViewModel(
                        episode: episode
                    )
                )
            }
            .navigationDestination(for: Location.self) { location in
                LocationDetailsView(
                    viewModel: DependencyContainer.shared.makeLocationDetailsViewModel(
                        location: location
                    )
                )
            }
            .onChange(of: viewModel.searchText) { newValue in
                viewModel.onSearchTextChange(newValue)
            }
        }
    }
}


#Preview {
    SearchView(viewModel: DependencyContainer.shared.makeSearchViewModel())
}
