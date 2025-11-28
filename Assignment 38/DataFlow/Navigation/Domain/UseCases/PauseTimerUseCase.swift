//
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

class PauseTimerUseCase {
    
    func pauseTimer(timer: TimerModel) -> TimerModel {
        guard timer.status == .running else { return timer }
        
        var pausedTimer = timer
        pausedTimer.status = .paused
        
        return pausedTimer
    }
}
