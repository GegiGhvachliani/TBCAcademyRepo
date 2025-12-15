//
//  LocationRow.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI

import SwiftUI

struct LocationRow: View {
    let location: Location
    
    var body: some View {
        ZStack {
            Image("LocationRowBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .cornerRadius(15)
                .opacity(0.8)
                .clipped()
            VStack(alignment: .leading, spacing: 4) {
                Text(location.name)
                    .foregroundStyle(.characterShadowGreen)
                    .font(.custom("Creepster-Regular", size: 30))
                    .minimumScaleFactor(0.5)
                    .bold()
                Text(location.dimension)
                    .font(.custom("Creepster-Regular", size: 20))
                    .foregroundColor(.titleBrown.opacity(1))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            
            .frame(height: 65)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.trailing, 20)
            .padding()
            .cornerRadius(10)
            
        }
    }
}

#Preview {
    let location = Location(id: 1, name: "dedamiwa", dimension: "C-114 GPA", residents: [], url: "123")
    LocationRow(location: location)
}

