//
//  DetailsView.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import SwiftUI

struct DetailsView: View {
    var timer: TimerModel
    @Binding var navigationPath: NavigationPath
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
         
            VStack(spacing: 10) {
                ZStack {
                    Text("\(timer.title)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 100)
                        .background(.timerBackground)
                    
                    Button {
                        navigationPath.removeLast()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 17)
                            .padding(.leading, 20)
                    }
                }
                
                VStack(spacing: 10) {
                    TopCardView(timer: timer)
                        .padding(.top, 5)
                    BottomCard(timer: timer)
                    
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}
