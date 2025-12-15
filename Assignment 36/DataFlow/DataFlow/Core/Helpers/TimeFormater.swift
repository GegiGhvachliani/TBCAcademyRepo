//
//  TimeFormater.swift
//  DataFlow
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import Foundation

class TimeFormater {
    static  func formatTime(_ seconds: Int) -> String {
        let h = seconds / 3600
        let m = (seconds % 3600) / 60
        let s = seconds % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}
