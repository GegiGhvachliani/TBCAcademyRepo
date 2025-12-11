//
//  ImageView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    var musicTitle: String
    var body: some View {
            VStack(spacing: 15){
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
                
                Text(musicTitle)
                    .font(.custom("Baloo-Regular", size: 30))
                    .foregroundStyle(.playerIslandTextPrimary1)
            }
            .padding()
            .background(.playerIslandTextSecondary.opacity(0.3))
            .cornerRadius(15)

    }
}
