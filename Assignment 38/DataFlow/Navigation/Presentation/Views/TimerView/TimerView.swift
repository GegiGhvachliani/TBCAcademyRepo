//
//  ContentView.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import SwiftUI


struct TimerView: View {
    @StateObject private var viewModel = TimerViewModel.makeTimerViewModel()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
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
                                NavigationLink(value: timer) {
                                    TimerRow(viewModel: viewModel, timer: timer)
                                }
                            }
                            .cornerRadius(20)
                        }
                        .navigationDestination(for: TimerModel.self) { timer in
                            DetailsView(
                                timer: timer,
                                navigationPath: $navigationPath
                            )
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
}

#Preview {
    TimerView()
}


