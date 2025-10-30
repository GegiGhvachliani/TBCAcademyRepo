//
//  QuestionPageViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

class QuestionPageViewModel {
    private let question: QuizQuestionModel
    
    private var selectedAnswerIndex: Int?
    
    // userDefault-ისთვის
    private var correctCount: Int = 0
    private var incorrectCount: Int = 0
    private var hasAnswered: Bool = false
    
    private var allAnswers: [String]
    
    var onAnswerSelected: (() -> Void)?
    
    init(question: QuizQuestionModel) {
        self.question = question
        self.allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()
        loadStats()
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
        
        saveStats() // userDefaultit unda davaimplemento
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
        // TODO: gadatvirte userDefault
        correctCount = 0
        incorrectCount = 0
    }
    
    private func saveStats() {
        // TODO: sheinaxe userDefault-shi
        print("Stats saved: Correct \(correctCount), Incorrect \(incorrectCount)")
    }
}
