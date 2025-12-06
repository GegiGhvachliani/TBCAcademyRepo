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
                .foregroundStyle(.green)
                .font(.title2)
                .bold()
            HStack {
                Text(episode.episode)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(episode.airDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(8)
    }
}
