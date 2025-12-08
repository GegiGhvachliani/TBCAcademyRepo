//
//  WheelSegment.swift
//  GesturesAndAnimations
//
//  Created by Gegi Ghvachliani on 08.12.25.
//
import SwiftUI

struct WheelSegment: View {
    var index: Int
    var total: Int
    var color: Color
    var name: String
    
    var startAngle: Double {
        Double(index) * (360.0 / Double(total)) - 90
    }
    
    var endAngle: Double {
        Double(index + 1) * (360.0 / Double(total)) - 90
    }
    
    var midAngle: Double {
        (startAngle + endAngle) / 2
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let center = CGPoint(x: size / 2, y: size / 2)
            let radius = size / 2
            
            ZStack {
                Path { path in
                    path.move(to: center)
                    path.addArc(
                        center: center,
                        radius: radius,
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(endAngle),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
                .fill(color)
                .overlay(
                    Path { path in
                        path.move(to: center)
                        path.addArc(
                            center: center,
                            radius: radius,
                            startAngle: .degrees(startAngle),
                            endAngle: .degrees(endAngle),
                            clockwise: false
                        )
                        path.closeSubpath()
                    }
                        .stroke(.black, lineWidth: 2)
                )
                
                Text(name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
                    .rotationEffect(.degrees(midAngle + 90))
                    .position(
                        x: center.x + (radius * 0.6) * cos(midAngle * .pi / 180),
                        y: center.y + (radius * 0.6) * sin(midAngle * .pi / 180)
                    )
            }
        }
    }
}
