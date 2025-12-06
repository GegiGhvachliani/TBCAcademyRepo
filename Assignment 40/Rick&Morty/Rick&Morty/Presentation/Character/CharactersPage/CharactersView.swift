//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    @ObservedObject var coordinator: CharactersCoordinator
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    if viewModel.isLoading && viewModel.characters.isEmpty {
                        ProgressView("Loading characters...")
                    } else if let error = viewModel.errorMessage {
                        Spacer()
                        Text(error)
                            .foregroundStyle(.red)
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20, content: {
                                ForEach(viewModel.characters, id: \.id) { character in
                                    CharacterComponentView(
                                        name: character.name,
                                        imageURL: character.image
                                    )
                                    .onTapGesture {
                                        coordinator.navigateToCharacterDetails(character)
                                    }
                                    .onAppear {
                                        if character.id == viewModel.characters.last?.id {
                                            Task {
                                                await viewModel.getMoreCharacters()
                                            }
                                        }
                                    }
                                }
                            })
                            .padding(.horizontal, 15)
                            .padding(.top, 20)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Image("Characters")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 50)
                    }
                    
                }
                .navigationDestination(for: Character.self) { character in
                    CharacterDetailsView(
                        viewModel: DependencyContainer.shared.makeCharacterDetailsViewModel(
                            character: character
                        )
                    )
                }
            }
            .task {
                await viewModel.getInitialCharacters()
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
