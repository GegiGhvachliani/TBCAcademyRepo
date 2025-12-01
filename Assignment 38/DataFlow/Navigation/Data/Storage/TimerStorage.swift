//
//  TimerStorage.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 02.12.25.
//

import Foundation

protocol TimerStorageProtocol {
    func save(timers: [TimerModel])
    func load() -> [TimerModel]?
}

class TimerStorage: TimerStorageProtocol {
    private static let timersKey: String = "timersKey"
    
    func save(timers: [TimerModel]) {
        let encoder = JSONEncoder()
        
        let data = try? encoder.encode(timers)
        
        UserDefaults.standard.set(data, forKey: TimerStorage.timersKey)
    }
    
     func load() -> [TimerModel]? {
        guard let data = UserDefaults.standard.data(forKey: TimerStorage.timersKey) else { return nil }
        
        let decoder = JSONDecoder()
        
        return try? decoder.decode([TimerModel].self, from: data)
    }

}
