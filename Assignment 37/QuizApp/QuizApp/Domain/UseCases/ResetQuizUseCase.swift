//
//  addAnswerUseCase.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//

class ResetQuizUseCase {
    private let repository: QuizRepositoryProtocol
    
    init(repository: QuizRepositoryProtocol) {
        self.repository = repository
    }
    
    func resetQuiz() -> QuizStats {
        let stats = QuizStats()
        
        repository.updateStats(with: stats)
        
        return stats
    }
}
