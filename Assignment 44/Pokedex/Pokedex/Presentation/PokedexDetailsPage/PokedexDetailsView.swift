//
//  PokedexDetailsView.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import SwiftUI

struct PokedexDetailsView: View {
    
    @StateObject var viewModel: PokedexDetailViewModel
    
    var body: some View {
        ZStack {
            Color(viewModel.primaryTypeColor)
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.white)
            } else if let pokedex = viewModel.pokedex {
                VStack(spacing: 0) {
                    PokedexHeaderComponentView(
                        imageURL: viewModel.imageURL
                    )
                    .frame(maxHeight: .infinity)
                    .padding(.bottom, -120)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            PokedexInfoView(
                                height: viewModel.heightInMeters,
                                weight: viewModel.weightInKilograms,
                                types: pokedex.types,
                                primaryColor: viewModel.primaryTypeColor
                            )
                            
                            // Stats section
                            PokedexStatsView(
                                stats: pokedex.stats,
                                primaryColor: viewModel.primaryTypeColor
                            )
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .frame(height: 500)
                }
                .padding(.bottom, -30)
            }
            
            VStack {
                PokedexCustomNavigationBar(
                    backgroundColor: Color(viewModel.primaryTypeColor),
                    pokedexName: viewModel.displayName,
                    pokedexID: viewModel.formatedID
                )
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.fetchPokedexDetail()
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
