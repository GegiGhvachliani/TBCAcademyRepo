//
//  EpisodeCharacterCardView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodeCharacterCardView: View {
    let name: String
    let imageURL: String
    
    var body: some View {
        VStack(spacing: 4) {
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(name)
                .font(.caption)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 60, height: 40)
        }
    }
}
