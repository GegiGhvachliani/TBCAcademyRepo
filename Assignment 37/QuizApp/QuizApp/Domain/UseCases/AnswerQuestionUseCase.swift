//
//  addAnswerUseCase.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//

class AnswerQuestionUseCase {
    private let repository: QuizRepositoryProtocol
    
    init(repository: QuizRepositoryProtocol) {
        self.repository = repository
    }
    
    func answerQuestion(selectedAnswer: Int, correctAnswer: Int) -> Bool {
        var stats = repository.getStats()

        let isCorrect = selectedAnswer == correctAnswer
        if isCorrect {
            stats.correctAnswers += 1
        }
        
        stats.answeredQuestions += 1
        repository.updateStats(with: stats)
        
        return isCorrect
    }
}
