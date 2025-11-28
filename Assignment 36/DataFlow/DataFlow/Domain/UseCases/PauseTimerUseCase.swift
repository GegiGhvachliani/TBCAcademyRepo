//
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import Foundation

class PauseTimerUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func pauseTimer(id: UUID) {
        repository.pauseTimer(id: id)
    }
}
