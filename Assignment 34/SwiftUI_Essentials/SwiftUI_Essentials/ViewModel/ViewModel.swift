//
//  File.swift
//  SwiftUI_Essentials
//
//  Created by Gegi Ghvachliani on 20.11.25.
//

import Foundation
import Observation

@Observable
final class ViewModel {
    private(set) var systemImageNames: [String]  = [
        "phone.fill",
        "envelope",
        "globe"
    ]
    
    private(set) var skills: [String] = [
        "SwiftUI",
        "iOS Development",
        "Problem Solving",
        "UI/UX Design"
    ]
    
    var isOnline = true
}
