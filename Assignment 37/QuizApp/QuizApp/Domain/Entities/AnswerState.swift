//
//  AnswerState.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

enum AnswerState {
    case notAnswered
    case answeredCorrect(selectedIndex: Int)
    case answeredWrong(selectedIndex: Int,
                       correctIndex: Int
    )
}
