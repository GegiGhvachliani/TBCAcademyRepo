//
//  SearchView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = DependencyContainer.shared.makeSearchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    Picker("Search Type", selection: $viewModel.selectedType) {
                        ForEach(SearchType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .padding(.top, 30)
                    .onChange(of: viewModel.selectedType) { _ in
                        viewModel.onSegmentChange()
                    }
                    
                    SearchBarView(
                        searchText: $viewModel.searchText,
                        onClear: { viewModel.clearResults() }
                    )
                    
                    SearchResultsView(
                        selectedType: viewModel.selectedType,
                        characters: viewModel.characters,
                        episodes: viewModel.episodes,
                        locations: viewModel.locations,
                        isLoading: viewModel.isLoading,
                        errorMessage: viewModel.errorMessage
                    )
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 60)
                    }
                }
                .searchNavigationDestinations()
                .onChange(of: viewModel.searchText) { newValue in
                    viewModel.onSearchTextChange(newValue)
                }
            }
        }
    }
}


#Preview {
    SearchView(viewModel: DependencyContainer.shared.makeSearchViewModel())
}
