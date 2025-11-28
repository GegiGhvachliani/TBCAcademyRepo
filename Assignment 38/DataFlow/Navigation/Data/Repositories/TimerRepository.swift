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
        TimerModel(title: "ტაიმერი 2", time: 1400),
  
    ]
    
    private static let timersKey: String = "timersKey"
    
    private func saveToUserDefault(timer: [TimerModel]) {
        let encoder = JSONEncoder()
        
        let data = try? encoder.encode(timer)
        
        UserDefaults.standard.set(data, forKey: TimerRepository.timersKey)
    }
    
    private func loadFromUserDefaults() -> [TimerModel]? {
        guard let data = UserDefaults.standard.data(forKey: TimerRepository.timersKey) else { return nil }
        
        let decoder = JSONDecoder()
        
        return try? decoder.decode([TimerModel].self, from: data)
    }
    
    init () {
        if let savedTimers = loadFromUserDefaults() {
            timers = savedTimers
        }
    }
    
    func add(timer: TimerModel) {
        timers.append(timer)
        saveToUserDefault(timer: timers)
    }
    
    func startTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        guard timers[index].remainingSeconds > 0 else {
            return
        }
        
        timers[index].status = .running
        saveToUserDefault(timer: timers)
    }
    
    func pauseTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        guard timers[index].status == .running else { return }
        
        timers[index].status = .paused
        saveToUserDefault(timer: timers)
    }
    
    func restartTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        
        timers[index].status = .restarted
        timers[index].remainingSeconds = timers[index].time
        saveToUserDefault(timer: timers)
    }
    
    func timerWork(id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        guard timers[index].status == .running else { return }
        
        timers[index].remainingSeconds -= 1
        
        if timers[index].remainingSeconds == 0 {
            timers[index].status = .restarted
        }
        
        saveToUserDefault(timer: timers)
    }
    
    func getAll() -> [TimerModel] {
        timers
    }
    
    func delete(id: UUID) {
        timers.removeAll{ $0.id == id }
        saveToUserDefault(timer: timers)

    }
    
    
}
