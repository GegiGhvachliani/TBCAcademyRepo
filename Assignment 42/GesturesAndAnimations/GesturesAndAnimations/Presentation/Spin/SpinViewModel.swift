//
//  Untitled.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//

import SwiftUI
import Combine

protocol SpinViewModelProtocol {
    func findWinner()
    func spin(dragSpeed: CGFloat)
}

class SpinViewModel: ObservableObject, SpinViewModelProtocol {
    
    @Published var participants: [String] = []
    @Published var rotation: Double = 0
    @Published var isSpinning: Bool = false
    @Published var winner: String? = nil
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink, .cyan]
    
    var degreesPerSegment: Double {
        guard participants.count > 0 else { return 360 }
        return 360.0 / Double(participants.count)
    }
    
    func findWinner() {
        guard participants.count > 0 else { return }
        
        let normalizedRotation = rotation.truncatingRemainder(dividingBy: 360)
        let adjustedRotation = normalizedRotation < 0 ? normalizedRotation + 360 : normalizedRotation
        
        let pointerPosition = (360 - adjustedRotation).truncatingRemainder(dividingBy: 360)
        
        let segmentIndex = Int(pointerPosition / degreesPerSegment) % participants.count
   
        winner = participants[segmentIndex]

    }

    func spin(dragSpeed: CGFloat) {
        guard !isSpinning && participants.count > 0 else { return }
        
        isSpinning = true
        winner = nil
        
        let baseSpins = Double.random(in: 3...6)
        let randomExtra = Double.random(in: 0...360)
        let velocityBonus = Double(abs(dragSpeed)) / 10
        
        let totalRotation = (baseSpins * 360) + randomExtra + velocityBonus
        
        withAnimation(.easeOut(duration: 3.0)) {
            rotation += totalRotation
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isSpinning = false
            self.findWinner()
        }
    }
}
