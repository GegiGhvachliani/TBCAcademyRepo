//
//  TimerWorkingPrincipleUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import Foundation

class TimerWorkingPrincipleUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: UUID) {
        repository.timerWork(id: id)
    }
}
