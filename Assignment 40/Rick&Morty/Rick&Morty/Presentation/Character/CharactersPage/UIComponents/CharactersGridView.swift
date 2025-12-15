//
//  CharactersGridView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct CharactersGridView: View {
    @ObservedObject var viewModel: CharactersViewModel
    @ObservedObject var coordinator: CharactersCoordinator
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10),
        GridItem(.adaptive(minimum: 170), spacing: 10)
    ]
    
    var body: some View {
        if viewModel.isLoading && viewModel.characters.isEmpty {
            ProgressView("Loading characters...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if let error = viewModel.errorMessage {
            Text(error)
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
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
                }
                .padding(.horizontal, 15)
                .padding(.top, 20)
            }
        }
    }
}
