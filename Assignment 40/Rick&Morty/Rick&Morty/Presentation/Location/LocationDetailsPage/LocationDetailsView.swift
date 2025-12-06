//
//  LocationDetailsVIew.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

//
//  LocationDetailsView.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 03.12.25.
//

import SwiftUI

struct LocationDetailsView: View {
    @ObservedObject var viewModel: LocationDetailsViewModel
    
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
                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.location.name)
                            .font(.title)
                            .bold()
                        
                        Text("Dimension: \(viewModel.location.dimension)")
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Text("Residents")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        if viewModel.isLoading && viewModel.characters.isEmpty {
                            Spacer()
                            ProgressView("Loading residents...")
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
                    await viewModel.getResidents()
                }
            }
            .navigationTitle("Details")
        }
    }
}


#Preview {
    MainView()
}

