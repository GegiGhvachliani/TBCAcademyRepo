//
//  LocationRow.swift
//  Rick&Morty
//
//  Created by Gegi Ghvachliani on 05.12.25.
//

import SwiftUI

struct LocationRow: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .foregroundStyle(.green)
                .font(.title2)
                .bold()
            HStack {
                Text(location.dimension)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(8)
    }
}
