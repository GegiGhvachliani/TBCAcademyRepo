//
//  TimerViewModel+Extension.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

extension TimerViewModel {
    static func create() -> TimerViewModel {
        let timerStorage: TimerStorageProtocol = TimerStorage()
        let repository: TimerRepositoryProtocol = TimerRepository(storage: timerStorage)
        let notificationService: TimerNotificationServiceProtocol = TimerNotificationService()
        
        let addTimerUseCase = AddTimerUseCase(repository: repository)
        let deleteTimerUseCase = DeleteTimerUseCase(repository: repository)
        let pauseTimerUseCase = PauseTimerUseCase(repository: repository)
        let restartTimerUseCase = RestartTimerUseCase(repository: repository)
        let startTimerUseCasee = StartTimerUseCase(repository: repository)
        let timerWorkingPrincipleUseCase = TimerWorkingPrincipleUseCase(repository: repository)
        
        return TimerViewModel(
            repository: repository,
            addTimerUsecase: addTimerUseCase,
            deleteTimerUseCase: deleteTimerUseCase,
            startTimerUseCase: startTimerUseCasee,
            pauseTimerUseCase: pauseTimerUseCase,
            restartTimerUseCase: restartTimerUseCase,
            timerWorkingUseCase: timerWorkingPrincipleUseCase,
            notificationService: notificationService)
    }
}
