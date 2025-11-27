//
//  addAnswerUseCase.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//

class NextQuestionUseCase {
    private let repository: QuizRepositoryProtocol
    
    init(repository: QuizRepositoryProtocol) {
        self.repository = repository
    }
    
    func nextQuestion() -> QuizStats {
        var stats = repository.getStats()
        
        stats.currentQuestionNumber += 1
        
        repository.updateStats(with: stats)
        
        return stats
    }
    
}
