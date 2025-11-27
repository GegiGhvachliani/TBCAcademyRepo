//
//  AnswersListView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

import SwiftUI

import SwiftUI

struct AnswersListView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            ForEach(0..<viewModel.currentQuestion.answers.count) { index in
                Button {
                    viewModel.answerQuestion(index: index)
                } label: {
                    ZStack(alignment: .leading) {
                        backgroundColor(for: index)
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: symbolImage(for: index))
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                                .foregroundStyle(.answerText)
                            Text("\(viewModel.currentQuestion.answers[index])")
                                .foregroundStyle(.answerText)
                        }
                    }
                    .cornerRadius(15)
                    .frame(height: 70)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 50)
    }
    
    func backgroundColor(for index: Int) -> Color {
        switch viewModel.answerState {
        case .notAnswered:
            return Color.white
            
        case .answeredCorrect(let selectedIndex):
            return selectedIndex == index ? .correctAnswer : .white
            
        case .answeredWrong(let selectedIndex, let correctIndex):
            if index == selectedIndex {
                return Color.incorrectAnswer
            } else if index == correctIndex {
                return Color.correctAnswer
            } else {
                return Color.white
            }
        }
    }
    
    func symbolImage(for index: Int) -> String {
        switch viewModel.answerState {
        case .notAnswered:
            return "circle"
        case .answeredCorrect(let selectedIndex):
            if index == selectedIndex {
                return "checkmark.circle.fill"
            } else {
                return "circle"
            }
            
        case .answeredWrong(let selectedIndex, _):
            if index == selectedIndex {
                return "checkmark.circle.fill"
            } else  {
                return "circle"
            }
            
        }
    }
    
    
}

#Preview {
    AnswersListView()
        .environmentObject(QuizViewModel.createForPreview())
}
