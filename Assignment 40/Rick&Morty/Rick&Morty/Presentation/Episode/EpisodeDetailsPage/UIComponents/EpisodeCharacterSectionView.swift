//
//  EpisodeCharacterSectionView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodeCharactersSectionView: View {
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10),
        GridItem(.adaptive(minimum: 170), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            Text("Characters")
                .font(.custom("GetSchwifty-Regular", size: 40))
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
}
