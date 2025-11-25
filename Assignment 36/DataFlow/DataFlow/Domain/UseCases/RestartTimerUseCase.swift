////
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

class RestartTimerUseCase {

    func restartTimer(timer: TimerModel) -> TimerModel {
        guard timer.status != .restarted else { return timer}
        
        var restartedTimer = timer
        
        restartedTimer.status = .restarted
        restartedTimer.remainingSeconds = restartedTimer.time
        
        return restartedTimer
    }
}
