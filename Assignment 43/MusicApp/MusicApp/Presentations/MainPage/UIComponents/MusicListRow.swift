//
//  MusicListRow.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct MusicListRow: View {
    var music: Music
    var body: some View {
        ZStack {
            Color.musicCell035
                .opacity(0.8)
            
            RowInformation(music: music)
                .padding(.horizontal, 20)
        }
        .frame(height: 100)
        .cornerRadius(15)
        .padding(.horizontal, 20)
    }
}


struct RowInformation: View {
    var music: Music
    var body: some View {
        HStack(spacing: 20){
            Image(music.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(music.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.musicCellTextPrimary)
                
                Text(music.artistName)
                    .font(.subheadline)
                    .foregroundStyle(.musicCellTextSecondary)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
    }
}

#Preview {
    
    MainView()
}
