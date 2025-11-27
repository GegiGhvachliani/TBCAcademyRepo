//
//
//  MainView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

struct QuestionPageView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                QuestionView()
                
                Spacer()
                
                AnswersListView()
            }
        }
    }
}

#Preview {
    QuestionPageView()
        .environmentObject(QuizViewModel.createForPreview())
}
