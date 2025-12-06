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
                            .shadow(color: .characterShadowGreen, radius: 15)
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
                    .font(.custom("GetSchwifty-Regular", size: 50))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.backgroundContrasGreen)
                    .bold()
                    .padding(.horizontal)
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
            .padding()
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.valueBrown.opacity(0.5))
                .frame(width: 70, alignment: .leading)
                .font(.custom("Creepster-Regular", size: 20))
            Text(value)
                .foregroundStyle(.titleBrown.opacity(1))
                .font(.custom("Creepster-Regular", size: 25))
                .bold()
        }
    }
}

#Preview {
    CharactersView(
        viewModel: DependencyContainer.shared.makeCharactersViewModel(),
        coordinator: DependencyContainer.shared.makeCharacterCoordinator()
    )
}
