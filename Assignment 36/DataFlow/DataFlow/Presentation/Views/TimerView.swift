//
//  ContentView.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import SwiftUI

func makeTimerViewModel() -> TimerViewModel {
    let repository: TimerRepositoryProtocol = TimerRepository()
    
    let addTimerUseCase: AddTimerUseCase = AddTimerUseCase(repository: repository)
    let pauseTimerUseCase: PauseTimerUseCase = PauseTimerUseCase()
    let restartTimerUseCase: RestartTimerUseCase = RestartTimerUseCase()
    let startTimerUseCase: StartTimerUseCase = StartTimerUseCase()
    let timerWorkginPrincipleUseCase: TimerWorkingPrincipleUseCase = TimerWorkingPrincipleUseCase()
    
    let viewModel = TimerViewModel(repository: repository,
                                   addTimerUsecase: addTimerUseCase,
                                   startTimerUseCase: startTimerUseCase,
                                   pauseTimerUseCase: pauseTimerUseCase,
                                   restartTimerUseCase: restartTimerUseCase,
                                   timerWorkingUseCase: timerWorkginPrincipleUseCase
    )
    
    return viewModel
}
struct TimerView: View {
    
    @StateObject private var viewModel = makeTimerViewModel()
    
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
                    .frame(height: 80)
                    .background(.timerBackground)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.timers) { timer in
                            TimerRow(viewModel: viewModel, timer: timer)
                        }
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 15)
                TimerAdderView(viewModel: viewModel)

            }
            .padding(.bottom, 0)

        }
    }
}

#Preview {
    TimerView()
}


