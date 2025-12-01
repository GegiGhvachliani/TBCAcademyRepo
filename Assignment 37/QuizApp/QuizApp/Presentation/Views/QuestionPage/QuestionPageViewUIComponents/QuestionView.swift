//
//  QuestionView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Question \(viewModel.stats.currentQuestionNumber)")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 11)
                    .background(.questionNumber)
                    .cornerRadius(20)
                
                Spacer()
                
                Text("Akaki")
                    .foregroundStyle(.white)
                    .font(Font.custom("Sen", size: 22))
            }
            .padding(.horizontal, 20)
            
            
            Text("\(viewModel.currentQuestion.question)")
                .foregroundStyle(.white)
                .lineSpacing(2)
                .font(Font.custom("Sen", size: 20))
                .padding(.horizontal, 23)
                .padding(.vertical, 60)
        }
    }
}
