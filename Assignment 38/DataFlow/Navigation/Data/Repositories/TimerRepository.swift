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
    
    func update(timer: TimerModel) {
        if let index = timers.firstIndex(where: { $0.id == timer.id}) {
            timers[index] = timer
            saveToUserDefault(timer: timers)
        }
    }
    
    func getAll() -> [TimerModel] {
        timers
    }
    
    func delete(id: UUID) {
        timers.removeAll{ $0.id == id }
        saveToUserDefault(timer: timers)

    }
    
    
}
