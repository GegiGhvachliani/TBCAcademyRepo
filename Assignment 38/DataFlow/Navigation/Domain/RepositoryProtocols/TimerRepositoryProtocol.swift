//
//  TimerRepositoryProtocol.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

protocol TimerRepositoryProtocol {
    func add(timer: TimerModel)
    func getAll() -> [TimerModel]
    func delete(id: UUID)
    func startTimer(id: UUID)
    func pauseTimer(id: UUID)
    func restartTimer(id: UUID)
    func timerWork(id: UUID)
}
