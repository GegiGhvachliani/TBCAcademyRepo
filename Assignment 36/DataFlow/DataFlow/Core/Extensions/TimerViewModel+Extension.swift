//
//  TimerViewModel+Extension.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

extension TimerViewModel {
    static func create() -> TimerViewModel {
        let repository: TimerRepositoryProtocol = TimerRepository()
        
        let addTimerUseCase = AddTimerUseCase(repository: repository)
        let pauseTimerUseCase = PauseTimerUseCase(repository: repository)
        let restartTimerUseCase = RestartTimerUseCase(repository: repository)
        let startTimerUseCasee = StartTimerUseCase(repository: repository)
        let timerWorkingPrincipleUseCase = TimerWorkingPrincipleUseCase(repository: repository)
        
        return TimerViewModel(
            repository: repository,
            addTimerUsecase: addTimerUseCase,
            startTimerUseCase: startTimerUseCasee,
            pauseTimerUseCase: pauseTimerUseCase,
            restartTimerUseCase: restartTimerUseCase,
            timerWorkingUseCase: timerWorkingPrincipleUseCase)
    }
}
