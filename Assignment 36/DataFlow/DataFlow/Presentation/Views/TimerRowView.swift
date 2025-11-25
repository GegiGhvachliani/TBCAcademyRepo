//
//  TimerRow.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import SwiftUI

struct TimerRow: View {
    @ObservedObject var viewModel: TimerViewModel
    var timer: TimerModel
    
    var body: some View {
        VStack {
            HStack {
                
                Text(timer.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                
                Button {
                    viewModel.deleteTimer(id: timer.id)
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                }
            }
            
            Text(formatTime(timer.remainingSeconds))
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.timerTime)
            
            HStack {
                Button {
                    if timer.status == .running {
                        viewModel.pauseTimer(timer: timer)
                    } else {
                        viewModel.startTimer(timer: timer)
                    }
                } label: {
                    Text(timer.status == .running ? "პაუზა" : "დაწყება")
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(timer.status == .running ? .pauseButton : .startButton)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.restartTimer(timer: timer)
                } label: {
                    Text("გადატვირთვა")
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.timerBackground)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

func formatTime(_ seconds: Int) -> String {
    let h = seconds / 3600
    let m = (seconds % 3600) / 60
    let s = seconds % 60
    return String(format: "%02d:%02d:%02d", h, m, s)
}
