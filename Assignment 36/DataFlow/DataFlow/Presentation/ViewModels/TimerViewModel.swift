//
//  TimerViewModel.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import Combine
import Foundation

class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] = []
    
    private let repository: TimerRepositoryProtocol
    
    private let addTimerUsecase: AddTimerUseCase
    private let deleteTimerUseCase: DeleteTimerUseCase
    private let startTimerUseCase: StartTimerUseCase
    private let pauseTimerUseCase: PauseTimerUseCase
    private let restartTimerUseCase: RestartTimerUseCase
    private let timerWorkingUseCase: TimerWorkingPrincipleUseCase
    private let notificationService: TimerNotificationServiceProtocol
    
    private var ticker: Timer?
    
    init(
        repository: TimerRepositoryProtocol,
        addTimerUsecase: AddTimerUseCase,
        deleteTimerUseCase: DeleteTimerUseCase,
        startTimerUseCase: StartTimerUseCase,
        pauseTimerUseCase: PauseTimerUseCase,
        restartTimerUseCase: RestartTimerUseCase,
        timerWorkingUseCase: TimerWorkingPrincipleUseCase,
        notificationService: TimerNotificationServiceProtocol
    ) {
        self.repository = repository
        self.addTimerUsecase = addTimerUsecase
        self.deleteTimerUseCase = deleteTimerUseCase
        self.startTimerUseCase = startTimerUseCase
        self.pauseTimerUseCase = pauseTimerUseCase
        self.restartTimerUseCase = restartTimerUseCase
        self.timerWorkingUseCase = timerWorkingUseCase
        self.notificationService = notificationService
        
        loadTimers()
        startTicking()
    }
    
    func loadTimers() {
        timers = repository.getAll()
    }
    
    func addTimer(title: String, hours: Int, minutes: Int, seconds: Int) {
        let result = addTimerUsecase.execute(title: title, hours: hours, minutes: minutes, seconds: seconds)
        
        switch result {
        case .success:
            loadTimers()
        case .failure(let error):
            print("error: \(error)")
        }
    }
    
    func startTimer(timerID: UUID) {
        startTimerUseCase.execute(id: timerID)
        loadTimers()
    }
    
    func pauseTimer(timerID: UUID) {
        pauseTimerUseCase.execute(id: timerID)
        loadTimers()
        
    }
    
    func restartTimer(timerID: UUID) {
        restartTimerUseCase.execute(id: timerID)
        loadTimers()
    }
    
    func deleteTimer(timerID: UUID) {
        repository.delete(id: timerID)
        loadTimers()
    }
    
    func workTimer() {
        let runningTimers = timers.filter { $0.status == .running }
        
        for timer in runningTimers {
            let oldRemainingSeconds = timer.remainingSeconds
            
            timerWorkingUseCase.execute(id: timer.id)
            
            if oldRemainingSeconds == 1 {
                notificationService.notifyTimerFinished()
            }
        }
        
        loadTimers()
    }
    
    private func startTicking() {
        ticker = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.workTimer()
        }
    }
}
