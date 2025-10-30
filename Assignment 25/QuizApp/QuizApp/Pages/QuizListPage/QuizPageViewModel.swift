//
//  QuizPageViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 30.10.25.
//
import Foundation

class QuizPageViewModel {
    private(set) var questions: [QuizQuestionModel] = []
    private let fileManager = FileManager.default
    
    var numberOfQuestions: Int {
        return questions.count
    }
    
    var onQuestionsLoaded: (() -> Void)?
    var onQuestionSelected: ((QuizQuestionModel, Int) -> Void)?
    
    init() {
        fetchData()
        }
        
    func fetchData() {
            guard let bundlePath = Bundle.main.resourcePath else { return }
            
            let filePath = (bundlePath as NSString).appendingPathComponent("Questions 1.json")
            
            guard fileManager.fileExists(atPath: filePath),
                  let data = fileManager.contents(atPath: filePath),
                  let response = try? JSONDecoder().decode(QuizQuestionResponseData.self, from: data) else {
                print("Failed to load questions")
                return
            }
            
            questions = response.results
        }
    
    func reset() {
        UserDefaults.standard.removeObject(forKey: "correct")
        UserDefaults.standard.removeObject(forKey: "incorrect")
    }
}
