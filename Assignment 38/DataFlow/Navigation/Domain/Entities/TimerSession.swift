//
//  TimerSession.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import Foundation

struct TimerSession: Equatable, Codable, Hashable {
    let id: UUID
    var date: Date
    var duration: Int
    
    init(date: Date, duration: Int) {
        self.id = UUID()
        self.date = date
        self.duration = duration
    }
}
