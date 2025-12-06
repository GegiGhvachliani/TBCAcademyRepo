//
//  EpisodeDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
        GridItem(.adaptive(minimum: 170), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
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
                    
                    
                    
                    VStack {
                        Text("Characters")
                            .font(.custom("GetSchwifty-Regular", size: 40))
                            .bold()
                            .padding(.horizontal)
                        
                        if viewModel.isLoading {
                            Spacer()
                            ProgressView("Loading characters...")
                            Spacer()
                        } else if let error = viewModel.errorMessage {
                            Text("Error: \(error)")
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        } else {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(viewModel.characters, id: \.id) { character in
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
