//
//  LocationHeader.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 06.12.25.
//

import SwiftUI

struct LocationHeaderView: View {
    let location: Location
    
    var body: some View {
        VStack(spacing: -20) {
            Text(location.name)
                .font(.custom("getSchwifty-Regular", size: 60))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(.backgroundContrasGreen)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)

            Image("LocationDetailImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Text("Dimension: \(location.dimension)")
                .font(.custom("Creepster-Regular", size: 30))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)
                .foregroundStyle(.titleBrown)
        }
        .padding(.horizontal)
    }
}
