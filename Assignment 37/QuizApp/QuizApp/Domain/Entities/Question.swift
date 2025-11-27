//
//  Question.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//
import Foundation

struct Question: Codable, Identifiable {
    let id: UUID
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}


