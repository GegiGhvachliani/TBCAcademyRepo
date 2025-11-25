//
//  TimerRepository.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

class TimerRepository: TimerRepositoryProtocol {
    private var timers: [TimerModel] = [
        TimerModel(title: "someTimer", time: 400),
        TimerModel(title: "someTimer1", time: 1400),
        TimerModel(title: "someTimer2", time: 3400),
        TimerModel(title: "someTimer3", time: 4400)
    ]
    
    func add(timer: TimerModel) {
        timers.append(timer)
    }
    
    func update(timer: TimerModel) {
        if let index = timers.firstIndex(where: { $0.id == timer.id}) {
            timers[index] = timer
        }
    }
    
    func getAll() -> [TimerModel] {
        timers
    }
    
    func delete(id: UUID) {
        timers.removeAll{ $0.id == id }
    }
    
    
}
