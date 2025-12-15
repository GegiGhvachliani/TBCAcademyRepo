//
//  LocationDetailsVIew.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct LocationDetailsView: View {
    @ObservedObject var viewModel: LocationDetailsViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    LocationHeaderView(location: viewModel.location)
                    
                    ResidentsGridView(
                        characters: viewModel.characters,
                        isLoading: viewModel.isLoading,
                        errorMessage: viewModel.errorMessage
                    )
                }
                .task {
                    await viewModel.getResidents()
                }
            }
        }
    }
}


#Preview {
    MainView()
}

