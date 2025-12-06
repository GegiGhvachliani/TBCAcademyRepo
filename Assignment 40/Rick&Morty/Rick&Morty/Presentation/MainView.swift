//
//  MainView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//


import SwiftUI

struct MainView: View {
    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some View {
        TabView(selection: $appCoordinator.selectedTab) {
            CharactersView(
                viewModel: DependencyContainer.shared.makeCharactersViewModel(),
                coordinator: appCoordinator.charactersCoordinator
            )
            .tabItem {
                Label("Characters", systemImage: "person.3")
            }
            .tag(AppCoordinator.Tab.characters)
            
            EpisodesView(
                viewModel: DependencyContainer.shared.makeEpisodesViewModel(),
                coordinator: appCoordinator.episodesCoordinator
            )
            .tabItem {
                Label("Episodes", systemImage: "video")
            }
            .tag(AppCoordinator.Tab.episodes)
            
            LocationsView(
                viewModel: DependencyContainer.shared.makeLocationsViewModel(),
                coordinator: appCoordinator.locationsCoordinator
            )
            .tabItem {
                Label("Locations", systemImage: "globe")
            }
            .tag(AppCoordinator.Tab.locations)
            
            SearchView()
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(AppCoordinator.Tab.search)
        }
        .onAppear {
            appCoordinator.start()
        }
    }
}

#Preview {
    MainView()
}
