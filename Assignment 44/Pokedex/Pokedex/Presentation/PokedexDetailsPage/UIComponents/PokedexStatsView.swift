//
//  PokedexStatsView.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import SwiftUI

struct PokedexStatsView: View {
    
    let stats: [Stat]
    let primaryColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Base Stats")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(primaryColor)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
            
            VStack(spacing: 12) {
                ForEach(stats, id: \.stat.name) { stat in
                    StatRow(stat: stat, primaryColor: primaryColor)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
    }
}

struct StatRow: View {
    let stat: Stat
    let primaryColor: Color
    
    private var displayName: String {
        switch stat.stat.name {
        case "hp": return "HP"
        case "attack": return "ATK"
        case "defense": return "DEF"
        case "special-attack": return "SATK"
        case "special-defense": return "SDEF"
        case "speed": return "SPD"
        default: return stat.stat.name.uppercased()
        }
    }
    
    private var progress: Double {
        min(Double(stat.baseStat) / 250.0, 1.0)
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Text(displayName)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(primaryColor)
                .frame(width: 60, alignment: .leading)
            
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 1, height: 20)
            
            Text(String(format: "%03d", stat.baseStat))
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .frame(width: 50, alignment: .leading)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(primaryColor)
                        .frame(width: geometry.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
        }
    }
}
