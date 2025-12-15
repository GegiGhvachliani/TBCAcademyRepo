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
    private let startTimerUseCase: StartTimerUseCase
    private let pauseTimerUseCase: PauseTimerUseCase
    private let restartTimerUseCase: RestartTimerUseCase
    private let timerWorkingUseCase: TimerWorkingPrincipleUseCase
    private let saveSessionUseCase: SaveSessionUseCase
    
    private var ticker: Timer?

    init(
        repository: TimerRepositoryProtocol,
        addTimerUsecase: AddTimerUseCase,
        startTimerUseCase: StartTimerUseCase,
        pauseTimerUseCase: PauseTimerUseCase,
        restartTimerUseCase: RestartTimerUseCase,
        timerWorkingUseCase: TimerWorkingPrincipleUseCase,
        saveSessionUseCase: SaveSessionUseCase
    ) {
        self.repository = repository
        self.addTimerUsecase = addTimerUsecase
        self.startTimerUseCase = startTimerUseCase
        self.pauseTimerUseCase = pauseTimerUseCase
        self.restartTimerUseCase = restartTimerUseCase
        self.timerWorkingUseCase = timerWorkingUseCase
        self.saveSessionUseCase = saveSessionUseCase
        
        loadTimers()
        startTicking()
    }
    
    func loadTimers() {
        timers = repository.getAll()
    }
    
    func addTimer(title: String, hours: Int, minutes: Int, seconds: Int)
    {
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
        saveSessionUseCase.execute(id: timerID)
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
            timerWorkingUseCase.execute(id: timer.id)
        }
        
        loadTimers()
    }
    
    private func startTicking() {
        ticker = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.workTimer()
        }
    }
}
