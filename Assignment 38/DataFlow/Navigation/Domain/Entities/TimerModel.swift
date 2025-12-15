//
//  TimerModel.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

struct TimerModel: Identifiable, Equatable, Codable, Hashable {
    let id: UUID
    let title: String
    let time: Int
    var remainingSeconds: Int
    var status: Status
    var sessions: [TimerSession]
    
    
    init(title: String, time: Int) {
        self.id = UUID()
        self.title = title
        self.time = time
        self.remainingSeconds = time
        self.status = .restarted
        self.sessions = []
    }
}

