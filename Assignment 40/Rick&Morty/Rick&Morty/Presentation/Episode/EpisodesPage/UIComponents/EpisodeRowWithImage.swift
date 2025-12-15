//
//  EpisodeRowWithImage.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodeRowWithImage: View {
    let episode: Episode
    
    var body: some View {
        ZStack {
            Image("EpisodesRowBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .cornerRadius(15)
                .opacity(0.6)
                .clipped()
            VStack(alignment: .leading, spacing: 4) {
                Text(episode.name)
                    .foregroundStyle(.characterShadowGreen)
                    .font(.custom("Creepster-Regular", size: 30))
                    .minimumScaleFactor(0.5)
                    .bold()
                Text(episode.episode)
                    .font(.custom("Creepster-Regular", size: 20))
                    .foregroundColor(.titleBrown.opacity(1))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            
            .frame(height: 65)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.trailing, 20)
            .padding()
            .cornerRadius(10)
            
        }
    }
}

#Preview {
    let episode = Episode(id: 1, name: "episode", airDate: "25:25:25", episode: "S01S10", characters: [], url: "asd")
    EpisodeRowWithImage(episode: episode)
}
