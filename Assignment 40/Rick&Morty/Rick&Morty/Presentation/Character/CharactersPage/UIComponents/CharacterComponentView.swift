//
//  CharacterComponentView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 04.12.25.
//

import SwiftUI

struct CharacterComponentView: View {
    var name: String
    var imageURL: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 170, height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 200)
                        .clipped()
                case .failure:
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .frame(width: 170, height: 200)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(name)
                .padding(.horizontal, 5)
                .padding(.vertical, 3)
                .frame(width: 170, height: 23)
                .foregroundStyle(.white)
                .font(.caption)
                .bold()
                .background(.green.opacity(0.8))
            
            
        }
        .clipped()
        .cornerRadius(12)
    }
}


#Preview {
    CharactersView(
        viewModel: DependencyContainer.shared.makeCharactersViewModel(),
        coordinator: DependencyContainer.shared.makeCharacterCoordinator())
}
