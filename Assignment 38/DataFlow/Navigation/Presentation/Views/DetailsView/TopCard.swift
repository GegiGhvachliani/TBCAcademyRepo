//
//  TopCard.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct TopCard: View {
    let timer: TimerModel
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text("\(timer.title)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 60)
                    .frame(height: 50)
                    .background(.timerBackground)
                
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
                        
                        Text("\(formatTime(timer.time))")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.timerTime)
                            .padding(.top, 5)
                        
                    }
                    
                }
            }
        }
        
    }
}
