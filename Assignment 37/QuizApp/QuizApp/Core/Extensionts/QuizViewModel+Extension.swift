//
//  QuizViewModel+Extension.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 27.11.25.
//

extension QuizViewModel {
   static func create() -> QuizViewModel {
        let repository: QuizRepositoryProtocol = QuizRepository()
        
        let answerQuestionUseCase: AnswerQuestionUseCase = AnswerQuestionUseCase(repository: repository)
        let nextQuestionUseCase: NextQuestionUseCase = NextQuestionUseCase(repository: repository)
        let resetQuizUseCase: ResetQuizUseCase = ResetQuizUseCase(repository: repository)
        
        return QuizViewModel(repository: repository,
                             answerQuestionUseCase: answerQuestionUseCase,
                             nextQuestionUseCase: nextQuestionUseCase,
                             resetQuizUseCase: resetQuizUseCase)
    }
    
    static func createForPreview() -> QuizViewModel {
          let repository = QuizRepository()
          
          // Force reset stats for preview
          let resetUseCase = ResetQuizUseCase(repository: repository)
          _ = resetUseCase.resetQuiz()
          
          let answerQuestionUseCase = AnswerQuestionUseCase(repository: repository)
          let nextQuestionUseCase = NextQuestionUseCase(repository: repository)
          
          return QuizViewModel(
              repository: repository,
              answerQuestionUseCase: answerQuestionUseCase,
              nextQuestionUseCase: nextQuestionUseCase,
              resetQuizUseCase: resetUseCase
          )
      }
}
