//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI

struct SpinView: View {
    @StateObject private var viewModel = SpinViewModel()
    @ObservedObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                if let winner = viewModel.winner {
                    Text("\(winner) Is Winner!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                
                ZStack {
                    
                    WheelView(
                        participants: viewModel.participants,
                        colors: viewModel.colors
                    )
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(viewModel.rotation))
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                let speed = value.translation.height
                                viewModel.spin(dragSpeed: speed)
                            }
                    )
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18, height: 25)
                        .offset(y: -157)
                }
                
                Text("Drag To Spin")
                    .font(.title2)
                    .foregroundStyle(.white)

            }
        }
        .onAppear {
            viewModel.participants = listViewModel.participantsList.participants
        }
        .onChange(of: listViewModel.participantsList.participants) { newValue in
            viewModel.participants = newValue
        }
    }
}
