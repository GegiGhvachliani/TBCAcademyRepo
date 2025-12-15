//
//  TimerRepository.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

class TimerRepository: TimerRepositoryProtocol {
    private var timers: [TimerModel] = [
        TimerModel(title: "ტაიმერი 1", time: 400),
        TimerModel(title: "ტაიმერი 2", time: 1400)
    ]
    
    private let storage: TimerStorageProtocol

    init(storage: TimerStorageProtocol) {
        self.storage = storage
        if let savedTimers = storage.load() {
            timers = savedTimers
        }
    }
    
    func add(timer: TimerModel) {
        timers.append(timer)
        storage.save(timers: timers)
    }
    
    func startTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        guard timers[index].remainingSeconds > 0 else {
            return
        }
        
        timers[index].status = .running
        storage.save(timers: timers)
    }
    
    func pauseTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        guard timers[index].status == .running else { return }
        
        timers[index].status = .paused
        storage.save(timers: timers)
    }
    
    func restartTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        timers[index].status = .restarted
        timers[index].remainingSeconds = timers[index].time
        storage.save(timers: timers)
    }
    
    func timerWork(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        guard timers[index].status == .running else { return }
        
        timers[index].remainingSeconds -= 1
        
        if timers[index].remainingSeconds == 0 {
            timers[index].status = .restarted
        }
        
        storage.save(timers: timers)
    }
    
    func getAll() -> [TimerModel] {
        timers
    }
    
    func delete(id: UUID) {
        timers.removeAll{ $0.id == id }
        storage.save(timers: timers)

    }
    
    func saveSession(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        let duration = timers[index].time - timers[index].remainingSeconds
        
        guard duration > 0 else { return }
        
        let session = TimerSession(date: Date(), duration: duration)
        timers[index].sessions.append(session)
        
        storage.save(timers: timers)
    }
}
