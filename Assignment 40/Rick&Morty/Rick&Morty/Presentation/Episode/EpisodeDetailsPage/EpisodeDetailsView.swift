//
//  EpisodeDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    EpisodeHeaderView(viewModel: viewModel)
                    EpisodeCharactersSectionView(viewModel: viewModel)
                }
                .task {
                    await viewModel.getCharacters()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
