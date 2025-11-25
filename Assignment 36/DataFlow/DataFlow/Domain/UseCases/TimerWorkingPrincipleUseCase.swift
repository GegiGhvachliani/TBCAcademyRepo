//
//  TimerWorkingPrincipleUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

class TimerWorkingPrincipleUseCase {
    func timerWorkingPrinciple(timer: TimerModel) -> TimerModel {
        guard timer.status == .running else {
            return timer
        }
        
        var updatedTimer = timer
        updatedTimer.remainingSeconds -= 1
        
        if updatedTimer.remainingSeconds == 0 {
            updatedTimer.status = .restarted
        }
        
        return updatedTimer
    }
}
