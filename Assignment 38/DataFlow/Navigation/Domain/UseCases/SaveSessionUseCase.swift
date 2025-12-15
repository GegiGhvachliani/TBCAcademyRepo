//
//  SaveSessionUseCase.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import Foundation

class SaveSessionUseCase {
    private let repository: TimerRepositoryProtocol
    
    init(repository: TimerRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: UUID) {
        repository.saveSession(id: id)
    }
}
