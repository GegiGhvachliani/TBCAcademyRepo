//
//  PokedexInfoView.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//
import SwiftUI

struct PokedexInfoView: View {
    
    let height: String
    let weight: String
    let types: [TypeElement]
    let primaryColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                ForEach(types, id: \.type.name) { typeElement in
                    TypeBadge(typeName: typeElement.type.name)
                }
            }
            .padding(.top, 30)
            
            Text("About")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(primaryColor)
                .padding(.top, 10)
            
            HStack(spacing: 0) {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "scalemass")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                        Text(weight)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                    }
                    
                    Text("Weight")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 1, height: 60)
                
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "ruler")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        
                        Text(height)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                    }
                    
                    Text("Height")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
        }
    }
}

struct TypeBadge: View {
    let typeName: String
    
    var body: some View {
        Text(typeName.capitalized)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
            .background(PokedexTypeColors.color(for: typeName))
            .cornerRadius(20)
    }
}
