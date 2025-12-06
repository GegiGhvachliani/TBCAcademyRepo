//
//  LocationsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct LocationsView: View {
    @ObservedObject var viewModel: LocationsViewModel
    @ObservedObject var coordinator: LocationsCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                if viewModel.isLoading && viewModel.locations.isEmpty {
                    Spacer()
                    ProgressView("Loading Locations")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    Text(error)
                        .foregroundStyle(.red)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 5) {
                            ForEach(viewModel.locations, id: \.id) { location in
                                LocationRow(location: location)
                                    .padding(.horizontal, 15)
                                    .onTapGesture {
                                        coordinator.navigateToDetails(location)
                                    }
                                    .onAppear {
                                        if location.id == viewModel.locations.last?.id {
                                            Task {
                                                await viewModel.getMoreLocations()
                                            }
                                        }
                                    }
                            }
                        }
                        .padding(.top, 40)
                    }
                }
            }
            .task {
                await viewModel.getInitialLocations()
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Locations")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 60)
                }
            }            .navigationDestination(for: Location.self) { location in
                LocationDetailsView(
                    viewModel: DependencyContainer.shared.makeLocationDetailsViewModel(
                        location: location
                    )
                )
            }
        }
    }
}



#Preview {
    LocationsView(
        viewModel: DependencyContainer.shared.makeLocationsViewModel(),
        coordinator: DependencyContainer.shared.makeLocationsCoordinator()
    )
}
