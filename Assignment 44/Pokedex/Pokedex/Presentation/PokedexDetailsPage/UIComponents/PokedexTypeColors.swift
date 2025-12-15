//
//  PokedexTypeColors.swift
//  Pokedex
//
//  Created by Gegi Ghvachliani on 15.12.25.
//

import SwiftUI

enum PokedexTypeColors {
    static func color(for type: String) -> Color {
        switch type.lowercased() {
        case "bug": return Color.bug
        case "dark": return Color.dark
        case "dragon": return Color.dragon
        case "electric": return Color.electric
        case "fairy": return Color.fairy
        case "fighting": return Color.fighting
        case "fire": return Color.fire
        case "flying": return Color.flying
        case "ghost": return Color.ghost
        case "grass": return Color.grass
        case "ground": return Color.ground
        case "ice": return Color.ice
        case "normal": return Color.normal
        case "poison": return Color.poison
        case "psychic": return Color.psychic
        case "rock": return Color.rock
        case "steel": return Color.steel
        case "water": return Color.water
        default: return Color.gray
        }
    }
}
