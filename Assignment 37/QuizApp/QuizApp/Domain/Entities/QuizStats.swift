//
//  QuizStats.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//


struct QuizStats: Codable {
    var answeredQuestions: Int
    var currentQuestionNumber: Int
    var correctAnswers: Int
    
    init() {
        self.answeredQuestions = 0
        self.currentQuestionNumber = 1
        self.correctAnswers = 0
    }
}
