//
//  EpisodeRow.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI

struct EpisodeRow: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(episode.name)
                .foregroundStyle(.characterShadowGreen)
                .font(.custom("Creepster-Regular", size: 30))
                .minimumScaleFactor(0.5) 
                .bold()
            HStack {
                Text(episode.episode)
                    .font(.custom("Creepster-Regular", size: 20))
                    .foregroundColor(.titleBrown.opacity(1))
                Spacer()
                Text(episode.airDate)
                    .font(.custom("Creepster-Regular", size: 15))
                    .foregroundColor(.valueBrown.opacity(0.5))
            }
        }
        .frame(height: 65)
        .padding()
        .background(Color.cell.opacity(0.3))
        .cornerRadius(10)
    }
}
