//
//  TimeFormater.swift
//  Navigation
//
//  Created by Gegi Ghvachliani on 29.11.25.
//
import Foundation

class TimeFormatter {
    static func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ka_GE")
        formatter.dateFormat = "dd MMM yyyy   HH:mm"
        return formatter.string(from: date)
    }
}
