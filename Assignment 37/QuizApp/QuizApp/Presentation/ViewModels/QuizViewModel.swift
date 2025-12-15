//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//
import Foundation
import Combine

class QuizViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var questions: [Question] = []
    @Published var stats: QuizStats = QuizStats()
    @Published var answerState: AnswerState = .notAnswered
    
    var currentQuestion: Question {
        let index = stats.currentQuestionNumber - 1
        return questions[index]
    }
    
    private let repository: QuizRepositoryProtocol
    
    private let answerQuestionUseCase: AnswerQuestionUseCase
    private let nextQuestionUseCase: NextQuestionUseCase
    private let resetQuizUseCase: ResetQuizUseCase
    
    // MARK: - Initialization
    init(repository: QuizRepositoryProtocol,
         answerQuestionUseCase: AnswerQuestionUseCase,
         nextQuestionUseCase: NextQuestionUseCase,
         resetQuizUseCase: ResetQuizUseCase
    ) {
        self.repository = repository
        self.answerQuestionUseCase = answerQuestionUseCase
        self.nextQuestionUseCase = nextQuestionUseCase
        self.resetQuizUseCase = resetQuizUseCase
        
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        questions =  repository.getQuestions()
        stats = repository.getStats()
    }
    
    func answerQuestion(index: Int) {
        let isCorrect = answerQuestionUseCase.answerQuestion(selectedAnswer: index,
                                                             correctAnswer: currentQuestion.correctAnswerIndex)
        
        if isCorrect {
            answerState = .answeredCorrect(selectedIndex: index)
        } else {
            answerState = .answeredWrong(selectedIndex: index,
                                         correctIndex: currentQuestion.correctAnswerIndex)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.nextQuestion()
        }
    }
    
    func nextQuestion() {
        guard stats.currentQuestionNumber < questions.count else { return }
        
        stats = nextQuestionUseCase.nextQuestion()
        answerState = .notAnswered
    }
    
    func resetQuiz() {
        stats = resetQuizUseCase.resetQuiz()
        answerState = .notAnswered
    }
}
