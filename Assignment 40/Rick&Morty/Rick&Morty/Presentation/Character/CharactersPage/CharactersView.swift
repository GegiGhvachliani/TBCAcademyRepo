//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    @ObservedObject var coordinator: CharactersCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                CharactersGridView(viewModel: viewModel, coordinator: coordinator)
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

#Preview {
    CharactersView(
        viewModel: DependencyContainer.shared.makeCharactersViewModel(),
        coordinator: DependencyContainer.shared.makeCharacterCoordinator()
    )
}
