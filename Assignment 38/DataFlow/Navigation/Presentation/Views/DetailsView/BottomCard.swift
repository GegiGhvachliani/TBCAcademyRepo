//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct BottomCard: View {
    let timer: TimerModel
    var body: some View {
        ZStack {
            Color.timerBackground
                .frame(height: 328)
                .cornerRadius(20)
                .padding(.horizontal, 15)
            
            VStack {
                VStack {
                    Text("აქტივობის ისტორია")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding(.top, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Text("თარიღი")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                        Spacer()
                        Text("დრო")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 80)
                    }
                    .padding(.vertical, 8)
                    .foregroundStyle(.white)
                    .font(Font.system(size: 15))
                }
                
                ScrollView{
                    ForEach(0..<timer.sessions.count) { session in
                        HStack {
                            let date = timer.sessions[session].date
                            Text("\(TimeFormatter.formatDate(date))")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(Font.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 40)
                                .padding(.top, 2)
                            Spacer()
                            let duration = timer.sessions[session].duration
                            Text("\(formatTime(duration))")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(Font.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 75)
                        }
                    }
                }
                .frame(height: 195)
            }
        }
        Spacer()
    }
    }

#Preview {
    TimerView()
}

