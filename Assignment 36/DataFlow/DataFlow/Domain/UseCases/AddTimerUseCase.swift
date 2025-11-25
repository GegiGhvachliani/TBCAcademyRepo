//
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

enum TimerErrors: Error {
    case titleIsEmpty
    case zeroTime
}

import Combine

class AddTimerUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func addTimer(title: String, hours: Int, minutes: Int, seconds: Int) -> Result<TimerModel, TimerErrors> {
        if title.isEmpty { return .failure(.titleIsEmpty)}
        
        let timeInSeconds = hours * 3600 + minutes * 60 + seconds
        
        if timeInSeconds == 0 { return .failure(.zeroTime)}
        
        let newTimer = TimerModel(title: title, time: timeInSeconds)
        repository.add(timer: newTimer)
        
        return .success(newTimer)
    }
}
