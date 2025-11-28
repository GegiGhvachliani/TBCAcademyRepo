//
//  AddTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//

import Foundation

enum StartError: Error {
    case noTime
}

class StartTimerUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func startTimer(id: UUID) {
        repository.startTimer(id: id)
    }
}
