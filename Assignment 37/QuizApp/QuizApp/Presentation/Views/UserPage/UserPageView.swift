//
//
//  MainView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

struct UserPageView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image("ProfileImage")
                
                CustomInfoStack(title: "Username", description: "Akaki")
                
                CustomInfoStack(title: "Questions answered", description: String(viewModel.stats.answeredQuestions))
                
                CustomInfoStack(title: "Current answers", description: String(viewModel.stats.correctAnswers))
                
                Text("Stats:")
                    .font(Font.custom("Sen", size: 18))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
                let value = Double(viewModel.stats.correctAnswers)
                let total = Double(viewModel.stats.answeredQuestions) > 0 ?
                            Double(viewModel.stats.answeredQuestions) :
                            1.0
                    
                ProgressView(value: value, total: total)
                    .background(.red)
                    .foregroundStyle(.green)
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    UserPageView()
        .environmentObject(QuizViewModel.create())
    
}
