//
//  QuizQuestionModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

struct QuizQuestionModel: Decodable {
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let questionNumber: String

    enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case questionNumber
    }
}

struct QuizQuestionResponseData: Decodable {
    let results: [QuizQuestionModel]
}
