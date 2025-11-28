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
                    .padding(.leading, 10)
                Spacer()
                
                Button {
                    viewModel.deleteTimer(timerID: timer.id)
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                        .offset(x: 0, y: -6)
                }
            }
            
            Text(formatTime(timer.remainingSeconds))
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.timerTime)
                .padding(.top, 5)
            
            HStack {
                Button {
                    if timer.status == .running {
                        viewModel.pauseTimer(timerID: timer.id)
                    } else {
                        viewModel.startTimer(timerID: timer.id)
                    }
                } label: {
                    Text(timer.status == .running ? "პაუზა" : "დაწყება")
                        .padding(.horizontal, 17)
                        .padding(.vertical, 10)
                        .background(timer.status == .running ? .pauseButton : .startButton)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.restartTimer(timerID: timer.id)
                } label: {
                    Text("გადატვირთვა")
                }
                .padding(.horizontal, 20)
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


#Preview {
    TimerView()
}
