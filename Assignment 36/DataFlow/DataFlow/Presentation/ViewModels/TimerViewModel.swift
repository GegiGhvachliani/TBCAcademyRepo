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
    
    private var ticker: Timer?

    init(repository: TimerRepositoryProtocol, addTimerUsecase: AddTimerUseCase, startTimerUseCase: StartTimerUseCase, pauseTimerUseCase: PauseTimerUseCase, restartTimerUseCase: RestartTimerUseCase, timerWorkingUseCase: TimerWorkingPrincipleUseCase) {
        self.repository = repository
        self.addTimerUsecase = addTimerUsecase
        self.startTimerUseCase = startTimerUseCase
        self.pauseTimerUseCase = pauseTimerUseCase
        self.restartTimerUseCase = restartTimerUseCase
        self.timerWorkingUseCase = timerWorkingUseCase
        
        loadTimers()
        startTicking()
    }
    
    func loadTimers() {
        timers = repository.getAll()
    }
    
    func addTimer(title: String, hours: Int, minutes: Int, seconds: Int)
    {
        let result = addTimerUsecase.addTimer(title: title, hours: hours, minutes: minutes, seconds: seconds)
        
        switch result {
            
        case .success(let timer):
            timers.append(timer)
        case .failure(let error):
            print("error: \(error)")
        }
    }
    
    func startTimer(timer: TimerModel) {
        let startedTimer = startTimerUseCase.startTimer(timer: timer)
        repository.update(timer: startedTimer)
        
        if let index = timers.firstIndex(where: { $0.id == startedTimer.id }) {
            timers[index] = startedTimer
        }
    }
    
    func pauseTimer(timer: TimerModel) {
        let pausedTimer = pauseTimerUseCase.pauseTimer(timer: timer)
        repository.update(timer: pausedTimer)
        
        if let index = timers.firstIndex(where: { $0.id == pausedTimer.id }) {
            timers[index] = pausedTimer
        }
    }
    
    func restartTimer(timer: TimerModel) {
        let restartedTimer = restartTimerUseCase.restartTimer(timer: timer)
        repository.update(timer: restartedTimer)
        
        if let index = timers.firstIndex(where: { $0.id == restartedTimer.id }) {
            timers[index] = restartedTimer
        }
    }
    
    func deleteTimer(id: UUID) {
        repository.delete(id: id)
        
        timers.removeAll(where: { $0.id == id } )
    }
    
    func workTimer() {
        for index in 0..<timers.count {
            if timers[index].status == .running {
                let updatedTimer = timerWorkingUseCase.timerWorkingPrinciple(timer: timers[index])
                repository.update(timer: updatedTimer)
                timers[index] = updatedTimer
            }
        }
    }
    
    private func startTicking() {
        ticker = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.workTimer()
        }
    }
}
