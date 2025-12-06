//
//  CharacterInfoView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI

struct CharacterInfoView: View {
    let viewModel: CharacterDetailsViewModel
    var body: some View {
            VStack {
                AsyncImage(url: URL(string: viewModel.character.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 300, height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                            .shadow(color: .green, radius: 10)
                    case .failure:
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                            .frame(width: 300, height: 300)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(viewModel.character.name)
                    .font(.largeTitle)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 10) {
                let character = viewModel.character
                
                DetailRow(label: "Gender: ", value: character.gender)
                DetailRow(label: "Status: ", value: character.status)
                DetailRow(label: "Species: ", value: character.species)
                DetailRow(label: "Origin: ", value: character.origin.name)
            }
            .padding(.horizontal)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .frame(width: 70, alignment: .leading)
                .font(.footnote)
            Text(value)
                .font(.headline)
                .bold()
        }
    }
}
