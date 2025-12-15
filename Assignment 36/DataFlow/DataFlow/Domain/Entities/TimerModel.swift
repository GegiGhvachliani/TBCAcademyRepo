//
//  TimerModel.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

struct TimerModel: Identifiable, Equatable, Codable {
    let id: UUID
    let title: String
    let time: Int
    var remainingSeconds: Int
    var status: Status
    
    
    init(title: String, time: Int) {
        self.id = UUID()
        self.title = title
        self.time = time
        self.remainingSeconds = time
        self.status = .restarted
    }
    
    enum Status: Equatable, Codable {
        case restarted
        case running
        case paused
    }
}

