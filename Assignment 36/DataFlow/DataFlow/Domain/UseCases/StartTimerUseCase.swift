//
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

enum StartError: Error {
    case noTime
}

class StartTimerUseCase {

    func startTimer(timer: TimerModel) -> TimerModel {
        guard timer.remainingSeconds > 0 else { return timer }
         
        var updatedTimer = timer
        updatedTimer.status = .running
        
        return updatedTimer
    }
}
