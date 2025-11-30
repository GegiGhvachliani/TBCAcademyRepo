//
//  TopCardView.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct TopCardView: View {
    let timer: TimerModel
    var body: some View {
        ZStack {
                ZStack {
                    Color.timerBackground
                        .frame(height: 328)
                        .cornerRadius(20)
                        .padding(.horizontal, 15)
                    
                    VStack {
                        Image("TimerImage")
                        
                        Text("ხანგრძლივობა")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .padding(.top, 10)
                        
                        Text("\(TimeFormatter.formatTime(timer.time))")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.timerTime)
                            .padding(.top, 5)
                    }
                }
            }
        }
    }

#Preview {
    TopCardView(timer: TimerModel(title: "Test Timer", time: 120))
}
