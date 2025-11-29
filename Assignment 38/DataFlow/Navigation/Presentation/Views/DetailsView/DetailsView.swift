//
//  DetailsView.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct DetailsView: View {
    var timer: TimerModel
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
                .padding(.top, 10)
                
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
                                    Text("\(formatDate(date))")
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
    }
}
func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ka_GE")
    formatter.dateFormat = "dd MMM yyyy   HH:mm"
    return formatter.string(from: date)
}
