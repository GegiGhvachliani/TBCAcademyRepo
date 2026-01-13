//
//  WheelView.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//
import SwiftUI

struct WheelView: View {
    var participants: [String]
    var colors: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let center = CGPoint(x: size / 2, y: size / 2)
            let radius = size / 2
            
            ZStack {
                ForEach(Array(participants.enumerated()), id: \.offset) { index, name in
                    WheelSegment(
                        index: index,
                        total: participants.count,
                        color: colors[index % colors.count],
                        name: name
                    )
                }
                
                Circle()
                    .fill(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(width: size, height: size)
        }
    }
}
