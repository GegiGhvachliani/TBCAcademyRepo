//
//  QuestionPageViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//
import Foundation

class QuestionPageViewModel {
    private let question: QuizQuestionModel
    
    private var selectedAnswerIndex: Int?
    
    
    private var correctCount: Int = 0 {
        didSet {
            UserDefaults.standard.set(correctCount, forKey: "correct")
        }
    }
    
    private var incorrectCount: Int = 0 {
        didSet {
            UserDefaults.standard.set(incorrectCount, forKey: "incorrect")
        }
    }
    
    private var hasAnswered: Bool = false
    
    private var allAnswers: [String]
    
    var onAnswerSelected: (() -> Void)?
    
    init(question: QuizQuestionModel) {
        self.question = question
        self.correctCount = UserDefaults.standard.integer(forKey: "correct")
        self.incorrectCount = UserDefaults.standard.integer(forKey: "incorrect")
        self.allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()
        
    }
    
    var questionNumberText: String {
        return "Question \(question.questionNumber)"
    }
    
    var questionText: String {
        return question.question
    }
    
    var numberOfAnswers: Int {
        return allAnswers.count
    }
    
    var statsText: String {
        return "    Correct Answer \(correctCount) / Incorrect \(incorrectCount)"
    }
    
    func answer(at index: Int) -> String {
        return allAnswers[index]
    }
    
    func selectAnswer(at index: Int) {
        guard !hasAnswered else { return }
        hasAnswered = true
        selectedAnswerIndex = index
        
        let selectedAnswer = allAnswers[index]
        let isCorrect = selectedAnswer == question.correctAnswer ? true : false
        
        if isCorrect {
            correctCount += 1
        } else {
            incorrectCount += 1
        }
        
        saveStats()
        onAnswerSelected?()
    }
    
    func isAnswerSelected(at index: Int) -> Bool {
        return selectedAnswerIndex == index
    }
    
    func isAnswerCorrect(at index: Int) -> Bool? {
        guard selectedAnswerIndex != nil else { return nil }
        return allAnswers[index] == question.correctAnswer
    }
    
    // MARK: UserDefaultebis gamoyeneba
    
    private func loadStats() {
        correctCount = 0
        incorrectCount = 0
    }
    
     func saveStats() {
        UserDefaults.standard.set(correctCount, forKey: "correct")
        UserDefaults.standard.set(incorrectCount, forKey: "incorrect")
    }
}
