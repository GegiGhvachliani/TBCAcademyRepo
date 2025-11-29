//
//  ContentView.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject private var viewModel = TimerViewModel.create()
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("ტაიმერები")
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    .frame(height: 90)
                    .background(.timerBackground)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.timers) { timer in
                            TimerRow(viewModel: viewModel, timer: timer)
                        }
                        .cornerRadius(20)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 15)
                TimerAdderView(viewModel: viewModel)

            }
            .padding(.bottom, 0)

        }
    }
}




