//
//  QuizRepositoryProtocol.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//

protocol QuizRepositoryProtocol {
    func getQuestions() -> [Question]
    func getStats() -> QuizStats
    func updateStats(with stats: QuizStats)
}

