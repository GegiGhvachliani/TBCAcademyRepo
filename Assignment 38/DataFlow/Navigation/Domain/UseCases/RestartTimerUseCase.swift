////
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import Foundation

class RestartTimerUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func restartTimer(id: UUID) {
        repository.restartTimer(id: id)
    }
}
