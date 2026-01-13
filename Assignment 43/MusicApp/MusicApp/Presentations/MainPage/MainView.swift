//
//  ContentView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        ForEach(viewModel.musics) { music in
                            MusicListRow(music: music)
                                .onTapGesture {
                                    coordinator.showDetails(music)
                                }
                        }
                    }
                }
            }
                .navigationDestination(for: Music.self) { music in
                    coordinator.create(for: music)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MusicApp")
                        .font(.custom("Milkyway DEMO", size: 50))
                        .offset(y: 20)
                        .foregroundColor(.appTitle)
                }
            }
        }
    }
}




#Preview {
    MainView()
}
