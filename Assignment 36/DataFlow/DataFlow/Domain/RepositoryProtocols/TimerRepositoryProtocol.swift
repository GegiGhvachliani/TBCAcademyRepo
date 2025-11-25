//
//  TimerRepositoryProtocol.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 25.11.25.
//
import Foundation

protocol TimerRepositoryProtocol {
    func add(timer: TimerModel)
    func update(timer: TimerModel)
    func getAll() -> [TimerModel]
    func delete(id: UUID)
    
}
