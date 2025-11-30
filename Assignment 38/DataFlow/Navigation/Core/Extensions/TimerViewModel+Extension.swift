//
//  TimerViewModel+Extension.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 30.11.25.
//

extension TimerViewModel {
    static func makeTimerViewModel() -> TimerViewModel {
        let repository: TimerRepositoryProtocol = TimerRepository()
        
        let addTimerUseCase: AddTimerUseCase = AddTimerUseCase(repository: repository)
        let pauseTimerUseCase: PauseTimerUseCase = PauseTimerUseCase(repository: repository)
        let restartTimerUseCase: RestartTimerUseCase = RestartTimerUseCase(repository: repository)
        let startTimerUseCase: StartTimerUseCase = StartTimerUseCase(repository: repository)
        let timerWorkginPrincipleUseCase: TimerWorkingPrincipleUseCase = TimerWorkingPrincipleUseCase(repository: repository)
        let saveSessionUseCase = SaveSessionUseCase(repository: repository)
        
        let viewModel = TimerViewModel(repository: repository,
                                       addTimerUsecase: addTimerUseCase,
                                       startTimerUseCase: startTimerUseCase,
                                       pauseTimerUseCase: pauseTimerUseCase,
                                       restartTimerUseCase: restartTimerUseCase,
                                       timerWorkingUseCase: timerWorkginPrincipleUseCase,
                                       saveSessionUseCase: saveSessionUseCase
        )
        
        return viewModel
    }
}
