//
//  DeleteTimerUseCase.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 02.12.25.
//

import Foundation

class DeleteTimerUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: UUID) {
        repository.delete(id: id)
    }
}
