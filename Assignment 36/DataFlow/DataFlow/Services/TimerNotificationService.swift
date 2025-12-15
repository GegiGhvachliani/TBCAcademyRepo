//
//  TimerNotificationService.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 02.12.25.
//

import AVFoundation

protocol TimerNotificationServiceProtocol {
    func notifyTimerFinished()
}

class TimerNotificationService: TimerNotificationServiceProtocol {
    func notifyTimerFinished() {
        AudioServicesPlaySystemSound(1016)
    }
}
