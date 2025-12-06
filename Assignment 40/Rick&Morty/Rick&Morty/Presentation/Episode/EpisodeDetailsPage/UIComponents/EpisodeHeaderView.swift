//
//  EpisodeHeaderView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct EpisodeHeaderView: View {
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    
    var body: some View {
        ZStack {
            Image("EpisodeDetailsPagePoster")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
                .opacity(0.6)
            
            VStack(alignment: .center, spacing: 15) {
                Text(viewModel.episode.name)
                    .font(.custom("Creepster-Regular", size: 40))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.backgroundContrasGreen)
                
                Text("Air Date: \(viewModel.episode.airDate)")
                    .font(.custom("SpecialElite-Regular", size: 20))
                    .foregroundStyle(.white)
                
                Text("Episode: \(viewModel.episode.episode)")
                    .font(.custom("SpecialElite-Regular", size: 20))
                    .foregroundStyle(.white)
            }
        }
        .clipped()
        .shadow(color: .titleBrown, radius: 10)
        .padding(.horizontal, 30)
        .padding(.vertical)
    }
}
