//
//  ControllerButtonsView.swift
//  MusicApp
//
//  Created by Gegi Ghvachliani on 11.12.25.
//

import SwiftUI

struct ControllerButtonsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        HStack(spacing: 30) {
            Button {
                viewModel.skipBackward()
            } label: {
                Image(systemName: "10.arrow.trianglehead.counterclockwise")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            Button {
                viewModel.togglePlayPause()
            } label: {
                Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            Button {
                viewModel.skipForward()
            } label: {
                Image(systemName: "10.arrow.trianglehead.clockwise")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }

    }
}

