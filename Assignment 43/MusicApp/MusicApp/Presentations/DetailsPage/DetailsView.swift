//
//  ContentView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct DetailsView: View {
    var music: Music
    
    @StateObject private var viewModel = DetailsViewModel()
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack(spacing: 80){
                ImageView(imageName: music.imageName, musicTitle: music.title)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.playerIsland)
                        .padding(.horizontal)
                        .frame(height: 150)
                    
                    VStack(spacing: 20){
                        CustomProgressView(progress: viewModel.progress)
                            .frame(height: 20)
                            .padding(.horizontal, 40)
                        
                        ControllerButtonsView(viewModel: viewModel)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.controlButtons)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("MusicApp")
                    .font(.custom("Milkyway DEMO", size: 50))
                    .offset(y: 20)
                    .foregroundColor(.appTitle)
            }
        }
        .onAppear {
            viewModel.loadMusic(music)
        }
    }
}


#Preview {
    let music = Music(title: "Tetnuldi", artistName: "Max 95", imageName: "LLTTFFRR", audioFileName: "Max_95_-_Tetnuldi")
    DetailsView(music: music)
}
