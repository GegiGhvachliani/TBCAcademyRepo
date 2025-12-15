//
//  SearchNavigationDestinations.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct SearchNavigationDestinations: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Character.self) { character in
                CharacterDetailsView(
                    viewModel: DependencyContainer.shared.makeCharacterDetailsViewModel(
                        character: character
                    )
                )
            }
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(
                    viewModel: DependencyContainer.shared.makeEpisodeDetailsViewModel(
                        episode: episode
                    )
                )
            }
            .navigationDestination(for: Location.self) { location in
                LocationDetailsView(
                    viewModel: DependencyContainer.shared.makeLocationDetailsViewModel(
                        location: location
                    )
                )
            }
    }
}

extension View {
    func searchNavigationDestinations() -> some View {
        modifier(SearchNavigationDestinations())
    }
}
