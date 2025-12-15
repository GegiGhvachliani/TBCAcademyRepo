//
//  ResidentsGridView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct ResidentsGridView: View {
    let characters: [Character]
    let isLoading: Bool
    let errorMessage: String?
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10),
        GridItem(.adaptive(minimum: 170), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            Text("Residents")
                .font(.custom("getSchwifty-Regular", size: 40))
                .padding(.horizontal)
                .padding(.bottom, 30)
            
            if isLoading && characters.isEmpty {
                ProgressView("Loading residents...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding(.horizontal)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(characters, id: \.id) { character in
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
