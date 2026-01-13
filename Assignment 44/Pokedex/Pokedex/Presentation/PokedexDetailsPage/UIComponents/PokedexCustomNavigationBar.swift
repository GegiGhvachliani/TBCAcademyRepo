//
//  PokedexCustomNavigationBar.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import SwiftUI

struct PokedexCustomNavigationBar: View {
    
    @Environment(\.dismiss) var dismiss
    let backgroundColor: Color
    let pokedexName: String
    let pokedexID: String
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Text(pokedexName)
                .font(.custom("Pokemon Solid", size: 35))
                .foregroundColor(.white)
                .padding(.leading, 12)
            
            Spacer()
            
            Text(pokedexID)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.top, 50)
        .padding(.bottom, 10)
        .offset(y: -15)
        .background(backgroundColor)
    }
}


#Preview {
    PokedexCustomNavigationBar(
        backgroundColor: Color.electric,
        pokedexName: "Pikachu",
        pokedexID: "#025"
    )
}
